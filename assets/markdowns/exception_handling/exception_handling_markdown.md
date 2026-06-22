## exceptions.dart

    sealed class AppException implements Exception {
        final String message;
        final Object? cause;

        const AppException(this.message, {this.cause});

        @override
        String toString() {
            if (cause != null) return '$runtimeType: $message\n  caused by: $cause';
            return '$runtimeType: $message';
        }
    }

    final class NetworkException extends AppException {
        const NetworkException([
            String message = 'No internet connection',
            Object? cause,
        ]) : super(message, cause: cause);
    }

    final class ServerException extends AppException {
        const ServerException([
            String message = 'Server error',
            Object? cause,
        ]) : super(message, cause: cause);
    }

    final class AppDatabaseException extends AppException {
        const AppDatabaseException([
            String message = 'Database error',
            Object? cause,
        ]) : super(message, cause: cause);
    }


## failures.dart

    enum FailureSeverity { info, warning, critical }

    sealed class Failure {
        final String _rawMessage; // Rename the internal storage field
        final FailureSeverity severity;
        final Failure? cause;

        const Failure(this._rawMessage, this.severity, {this.cause});

        // This is what the UI will read. It automatically chains the messages together!
        String get message {
            if (cause != null) {
            // This flips the order: "Server error + Database error"
            return '${cause!.message} + $_rawMessage';
            }
            return '$_rawMessage';
        }

        /// Used strictly for developer logging (terminal console text)
        String get chain {
            final buffer = StringBuffer(_rawMessage);
            Failure? current = cause;
            while (current != null) {
            buffer.write('\n  → caused by: ${current._rawMessage}');
            current = current.cause;
            }
            return buffer.toString();
        }
    }

    final class NetworkFailure extends Failure {
        const NetworkFailure([String message = 'No internet connection', Failure? cause])
        : super(
            message,
            FailureSeverity.critical,
            cause: cause,
        );
    }

    final class ServerFailure extends Failure {
        const ServerFailure([String message = 'Server error', Failure? cause])
        : super(
            message,
            FailureSeverity.critical,
            cause: cause,
        );
    }

    final class CacheFailure extends Failure {
        const CacheFailure([String message = 'No cached data available', Failure? cause])
        : super(
            message,
            FailureSeverity.warning,
            cause: cause,
        );
    }

    final class UnknownFailure extends Failure {
        const UnknownFailure([String message = 'Something went wrong', Failure? cause])
        : super(
            message,
            FailureSeverity.critical,
            cause: cause,
        );
    }


## guards.dart

    Future<T> guardedApiCall<T>(Future<T> Function() call) async {
        try {
            return await call();
        } on SocketException catch (e) {
            throw NetworkException('No internet connection', e);
        } on TimeoutException catch (e) {
            throw NetworkException('Request timed out', e);
        } on HttpException catch (e) {
            throw NetworkException('Network error', e);
        } on FormatException catch (e) {
            throw ServerException('Invalid response format', e);
        }
    }

    Future<Result<ResultType>> safeRepositoryCall<ResultType>({
        required Future<ResultType> Function() call,
        required Logger logger,
        Future<Result<ResultType>> Function(AppException cause)? onNetworkError,
        Future<Result<ResultType>> Function(AppException cause)? onServerError,
    }) async {
        try {
            return Success(await call());
        } on NetworkException catch (e) {
            if (onNetworkError != null) return onNetworkError(e);
            return Failed(mapExceptionToFailure(e));
        } on ServerException catch (e) {
            if (onServerError != null) return onServerError(e);
            return Failed(mapExceptionToFailure(e));
        } on AppDatabaseException catch (e) {
            return Failed(mapExceptionToFailure(e));
        } on AppException catch (e) {
            return Failed(mapExceptionToFailure(e));
        } catch (e, st) {
            logger.severe('Unexpected repository error', e, st);
            return const Failed(UnknownFailure());
        }
    }

    Failure mapExceptionToFailure(AppException e) {
        // If the inner cause is also an AppException, map it down the chain
        final Failure? innerCause = e.cause is AppException ? mapExceptionToFailure(e.cause as AppException) : null;

        return switch (e) {
            NetworkException() => NetworkFailure(e.message, innerCause),
            ServerException() => ServerFailure(e.message, innerCause),
            AppDatabaseException() => CacheFailure(e.message, innerCause),
        };
    }

## posts_bloc.dart

    // Events
    sealed class PostsEvent {}

    class FetchPosts extends PostsEvent {}

    // States
    /* 
        Equatable package and is used to make object comparison based on values instead of memory addresses.
        Without Equitable
        final state1 = PostsLoaded([]);
        final state2 = PostsLoaded([]);

        print(state1 == state2); // false

        With Equatable
        final state1 = PostsLoaded([]);
        final state2 = PostsLoaded([]);

        print(state1 == state2); // true
    */
    sealed class PostsState extends Equatable {
        const PostsState();

        @override
        List<Object?> get props => [];
    }

    class PostsInitial extends PostsState {}

    class PostsLoading extends PostsState {}

    class PostsLoaded extends PostsState {
        final List<Post> posts;

        const PostsLoaded(this.posts);

        @override
        List<Object?> get props => [posts];
    }

    class PostsError extends PostsState {
        final Failure failure;
        const PostsError(this.failure);

        @override
        List<Object?> get props => [failure];
    }

    // BLoC
    class PostsBloc extends Bloc<PostsEvent, PostsState> {
        // In clean architecture, every useCase is injected individually, so in future if there is requirement for remove pose use case, it will be injected separately
        final GetPostsUseCase getPostsUseCase;

        PostsBloc({
            required this.getPostsUseCase,
        }) : super(PostsInitial()) {
            on<FetchPosts>((event, emit) async {
            emit(PostsLoading());
            final result = await getPostsUseCase();

            // Why error handling is required in block when it is already done in apiService and repository?
            // This is because every stage is handling errors related to it, bloc will receive exceptions that have occured
            // at various stages and help convert those exceptions and failures to store in states and show via UI
            switch (result) {
                case Success(value: final posts):
                emit(PostsLoaded(posts));
                case Failed(failure: final failure):
                emit(PostsError(failure));
            }
            });
        }
    }


## view.dart

    class PostsAppView extends StatelessWidget {
        const PostsAppView({super.key});

        @override
        Widget build(BuildContext context) {
            return PageScaffold(
                title: 'Posts',
                mobileUi: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: BlocConsumer<PostsBloc, PostsState>(
                            listenWhen: (_, current) => current is PostsError,
                            listener: (context, state) {
                            if (state is PostsError) {
                                // Scenario A: Non-blocking severity gets an overlay snackbar
                                if (state.failure.severity != FailureSeverity.critical) {
                                FailureSnackbar.show(context, state.failure);
                                }
                            }
                            },
                            builder: (context, state) {
                            // 1. Handle Loading States
                            if (state is PostsInitial || state is PostsLoading) {
                                return const Center(child: CircularProgressIndicator());
                            }

                            // 2. Handle Data Availability (Even if accompanied by a transient warning)
                            if (state is PostsLoaded) {
                                return RefreshIndicator(
                                onRefresh: () async => context.read<PostsBloc>().add(FetchPosts()),
                                child: ListView.builder(
                                    itemCount: state.posts.length,
                                    itemBuilder: (context, index) {
                                    final post = state.posts[index];
                                    return ListTile(
                                        title: Text(post.title),
                                        subtitle: Text(post.body),
                                    );
                                    },
                                ),
                                );
                            }

                            // 3. Handle Hard Errors (When no data is present and severity is critical)
                            if (state is PostsError) {
                                if (state.failure.severity == FailureSeverity.critical) {
                                return ShowError(
                                    failure: state.failure,
                                    onRetry: () => context.read<PostsBloc>().add(FetchPosts()),
                                );
                                }

                                // If it's a non-critical error but we have no data, show an empty state placeholder
                                return const Center(
                                child: Text('No data available. Pull down to refresh.'),
                                );
                            }

                            return const SizedBox.shrink();
                            },
                        ),
                    ),
                ],
            );
        }
    }
