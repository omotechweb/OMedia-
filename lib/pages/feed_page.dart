import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/posts_controller.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final posts = context.watch<PostsController>().posts;

    return Scaffold(
      appBar: AppBar(title: const Text('Feed')),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final p = posts[index];
          return ListTile(
            title: Text(p.authorName),
            subtitle: Text(p.content),
            trailing: Text('${p.createdAt.hour}:${p.createdAt.minute}'),
          );
        },
      ),
    );
  }
}
