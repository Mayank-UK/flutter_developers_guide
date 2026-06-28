import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_developers_guide/ui/blocs/images/images_bloc.dart';
import 'package:flutter_developers_guide/ui/components/code_preview_tabs.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class FirebaseStorageView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/third_party_services/firebase.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Firebase Storage',
      mobileUi: [
        CodePreviewTabs(
          previewTab: BlocProvider(
            create: (_) => GetIt.I<ImagesBloc>()..add(WatchImages()),
            child: const _FirebaseStorageImplementation(),
          ),
          codeTabMarkdownLocation: _codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _FirebaseStorageImplementation extends StatelessWidget {
  const _FirebaseStorageImplementation();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      child: Column(
        children: [
          const _UploadBar(),
          Expanded(child: _ImageGrid()),
        ],
      ),
    );
  }
}

class _UploadBar extends StatelessWidget {
  const _UploadBar();

  Future<void> _pickAndUpload(BuildContext context) async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked == null) return;

    // TODO: replace with actual userId from your AuthBloc/session
    const userId = 'dev_user';

    if (context.mounted) {
      context.read<ImagesBloc>().add(UploadImage(File(picked.path), userId));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImagesBloc, ImagesState>(
      builder: (context, state) {
        final isUploading = state is ImagesLoaded && state.isUploading;

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Upload an image to Firebase Storage',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(width: 8),
              isUploading
                  ? const SizedBox(
                      width: 40,
                      height: 40,
                      child: CircularProgressIndicator(),
                    )
                  : IconButton.filled(
                      onPressed: () => _pickAndUpload(context),
                      icon: const Icon(Icons.add_photo_alternate_outlined),
                    ),
            ],
          ),
        );
      },
    );
  }
}

class _ImageGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImagesBloc, ImagesState>(
      builder: (context, state) => switch (state) {
        ImagesInitial() ||
        ImagesLoading() =>
          const Center(child: CircularProgressIndicator()),
        ImagesLoaded(images: final images) when images.isEmpty =>
          const Center(child: Text('No images yet. Upload one above!')),
        ImagesLoaded(images: final images) => GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
            itemCount: images.length,
            itemBuilder: (context, index) => _ImageTile(image: images[index]),
          ),
        ImagesError(failure: final failure) =>
          Center(child: Text('Error: ${failure.message}')),
      },
    );
  }
}

class _ImageTile extends StatelessWidget {
  final image;

  const _ImageTile({required this.image});

  @override
  Widget build(BuildContext context) {
    // TODO: replace with actual userId from your AuthBloc/session
    const userId = 'dev_user';

    return GestureDetector(
      onLongPress: () => _confirmDelete(context, userId),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          image.url,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, progress) {
            if (progress == null) return child;
            return const Center(child: CircularProgressIndicator());
          },
          errorBuilder: (context, _, __) => const ColoredBox(
            color: Colors.black12,
            child: Icon(Icons.broken_image_outlined),
          ),
        ),
      ),
    );
  }

  void _confirmDelete(BuildContext context, String userId) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Delete image?'),
        content: const Text('This will remove it from Storage and Firestore.'),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              context.pop();
              context.read<ImagesBloc>().add(
                    DeleteImage(image.id, image.fileName, userId),
                  );
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
