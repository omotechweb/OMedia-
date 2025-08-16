import 'package:flutter/material.dart';
import 'package:omedia/controllers/posts_controller.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final posts = context.watch<PostsController>().posts;
    final f = DateFormat('HH:mm  dd.MM.yyyy');

    return ListView.separated(
      padding: const EdgeInsets.all(12),
      itemCount: posts.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (_, i) {
        final p = posts[i];
        return ListTile(
          leading: const CircleAvatar(child: Icon(Icons.person)),
          title: Text(p.authorName),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(p.content),
              const SizedBox(height: 6),
              Text(f.format(p.createdAt), style: const TextStyle(fontSize: 12)),
            ],
          ),
        );
      },
    );
  }
}
