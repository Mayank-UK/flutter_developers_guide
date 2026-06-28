import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_developers_guide/core/error_handling/failures.dart';
import 'package:flutter_developers_guide/core/result.dart';
import 'package:flutter_developers_guide/domain/models/image_item.dart';
import 'package:flutter_developers_guide/domain/usecases/images/delete_image_use_case.dart';
import 'package:flutter_developers_guide/domain/usecases/images/upload_image_use_case.dart';
import 'package:flutter_developers_guide/domain/usecases/images/watch_images_use_case.dart';
import 'package:injectable/injectable.dart';

// Events
sealed class ImagesEvent {}

class WatchImages extends ImagesEvent {}

class UploadImage extends ImagesEvent {
  final File file;
  final String userId;
  UploadImage(this.file, this.userId);
}

class DeleteImage extends ImagesEvent {
  final String id;
  final String fileName;
  final String userId;
  DeleteImage(this.id, this.fileName, this.userId);
}

// States
sealed class ImagesState extends Equatable {
  const ImagesState();

  @override
  List<Object?> get props => [];
}

class ImagesInitial extends ImagesState {}

class ImagesLoading extends ImagesState {}

class ImagesLoaded extends ImagesState {
  final List<ImageItem> images;
  final bool isUploading; // keeps grid visible during upload
  const ImagesLoaded(this.images, {this.isUploading = false});

  @override
  List<Object?> get props => [images, isUploading];
}

class ImagesError extends ImagesState {
  final Failure failure;
  const ImagesError(this.failure);

  @override
  List<Object?> get props => [failure];
}

// BLoC
@injectable
class ImagesBloc extends Bloc<ImagesEvent, ImagesState> {
  final WatchImagesUseCase watchImagesUseCase;
  final UploadImageUseCase uploadImageUseCase;
  final DeleteImageUseCase deleteImageUseCase;

  ImagesBloc({
    required this.watchImagesUseCase,
    required this.uploadImageUseCase,
    required this.deleteImageUseCase,
  }) : super(ImagesInitial()) {
    on<WatchImages>(_onWatchImages);
    on<UploadImage>(_onUploadImage);
    on<DeleteImage>(_onDeleteImage);
  }

  Future<void> _onWatchImages(
      WatchImages event, Emitter<ImagesState> emit) async {
    emit(ImagesLoading());

    await emit.forEach<Result<List<ImageItem>>>(
      watchImagesUseCase(),
      onData: (result) => switch (result) {
        Success(value: final images) => ImagesLoaded(images),
        Failed(failure: final failure) => ImagesError(failure),
      },
      onError: (_, __) => ImagesError(UnknownFailure('Stream error')),
    );
  }

  Future<void> _onUploadImage(
      UploadImage event, Emitter<ImagesState> emit) async {
    // Show uploading indicator while keeping the current grid visible
    if (state is ImagesLoaded) {
      emit(ImagesLoaded(
        (state as ImagesLoaded).images,
        isUploading: true,
      ));
    }

    final result = await uploadImageUseCase(event.file, event.userId);

    if (result case Failed(failure: final failure)) {
      emit(ImagesError(failure));
    }
    // On success: stream emits updated list automatically
  }

  Future<void> _onDeleteImage(
      DeleteImage event, Emitter<ImagesState> emit) async {
    final result =
        await deleteImageUseCase(event.id, event.fileName, event.userId);

    if (result case Failed(failure: final failure)) {
      emit(ImagesError(failure));
    }
    // On success: stream emits updated list automatically
  }
}
