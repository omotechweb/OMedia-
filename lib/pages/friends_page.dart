import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/friends_controller.dart';
import '../controllers/auth_controller.dart';
import '../models/user.dart';

class FriendsPage extends StatelessWidget {
  const FriendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthController>().current;
    final friendsController = context.watch<FriendsController>();
    final friends = friendsController.friends;

    return Scaffold(
      appBar: AppBar(title: const Text('Friends')),
      body: ListView.builder(
        itemCount: friends.length,
        itemBuilder: (context, index) {
          final f = friends[index];
          return ListTile(
            leading: CircleAvatar(backgroundImage: NetworkImage(f.avatarUrl)),
            title: Text(f.name),
            subtitle: Text('@${f.username}'),
          );
        },
      ),
    );
  }
}
