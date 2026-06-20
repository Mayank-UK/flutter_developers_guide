import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_developers_guide/ui/blocs/posts/post_bloc.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

class PostsAppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Posts",
      mobileUi: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: BlocBuilder<PostsBloc, PostsState>(
            builder: (context, state) {
              if (state is PostsInitial) {
                return Center(child: CircularProgressIndicator());
              } else if (state is PostsLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is PostsLoaded) {
                return ListView.builder(
                  itemCount: state.posts.length,
                  itemBuilder: (context, index) {
                    final post = state.posts[index];
                    return ListTile(
                      title: Text(post.title),
                      subtitle: Text(post.body),
                    );
                  },
                );
              } else if (state is PostsError) {
                return Center(child: Text('Error: ${state.message}'));
              }
              return Container();
            },
          ),
        )
      ],
    );
  }
}
