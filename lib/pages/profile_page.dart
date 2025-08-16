import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/auth_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final me = context.watch<AuthController>().current;

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(radius: 50, backgroundImage: NetworkImage(me.avatarUrl)),
            const SizedBox(height: 10),
            Text(me.name, style: const TextStyle(fontSize: 22)),
            Text('@${me.username}', style: const TextStyle(color: Colors.grey)),
            Text('Yaş: ${me.age}'),
            Text(me.email),
          ],
        ),
      ),
    );
  }
}
