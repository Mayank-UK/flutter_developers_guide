import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_developers_guide/core/error_handling/failures.dart';
import 'package:flutter_developers_guide/ui/blocs/posts/post_bloc.dart';
import 'package:flutter_developers_guide/ui/components/failure_snackbar.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';
import 'package:flutter_developers_guide/ui/components/show_error.dart';

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
                  onRefresh: () async =>
                      context.read<PostsBloc>().add(FetchPosts()),
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
