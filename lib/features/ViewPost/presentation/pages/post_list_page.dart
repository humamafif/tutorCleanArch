import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internalcap/features/ViewPost/presentation/bloc/viewpost_bloc.dart';

class PostListPage extends StatelessWidget {
  const PostListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Post List'),
        ),
        body: Column(
          children: [
            Text('Post List'),
            SizedBox(height: 56),
            Expanded(child: BlocBuilder<ViewpostBloc, ViewpostState>(
                builder: (context, state) {
              if (state is PostStateLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is PostStateLoaded) {
                return ListView.builder(
                  itemCount: state.posts.length,
                  itemBuilder: (context, index) {
                    final post = state.posts[index];
                    return ListTile(
                      leading: Text('${post.id}'),
                      title: Text(post.title ?? 'No Title'),
                      subtitle: Text(post.body ?? 'No Body'),
                    );
                  },
                );
              } else if (state is PostStateError) {
                return Center(child: Text(state.message));
              } else {
                return const Center(child: Text('No data'));
              }
            }))
          ],
        ));
  }
}
