import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/posts_controller.dart';
import '../controllers/auth_controller.dart';
import '../models/post.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthController>().current;

    return Scaffold(
      appBar: AppBar(title: const Text('Create Post')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(hintText: 'Ne paylaşmak istiyorsun?'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                final post = Post(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  authorId: user.id,
                  authorName: user.name,
                  content: _controller.text,
                  createdAt: DateTime.now(),
                );
                context.read<PostsController>().createPost(post);
                _controller.clear();
              },
              child: const Text('Paylaş'),
            )
          ],
        ),
      ),
    );
  }
}
