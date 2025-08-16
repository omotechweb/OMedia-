import 'package:flutter/material.dart';
import 'package:omedia/controllers/auth_controller.dart';
import 'package:omedia/controllers/chat_controller.dart';
import 'package:omedia/pages/chat_page.dart';
import 'package:provider/provider.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final me = context.watch<AuthController>().current;

    if (me == null) {
      return const Center(child: Text('Mesajlar için önce giriş yap.'));
    }

    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: context.read<ChatController>().inbox(me.id),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        final items = snap.data ?? [];
        if (items.isEmpty) {
          return const Center(child: Text('Henüz bir sohbet yok'));
        }

        return ListView.separated(
          itemCount: items.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (context, i) {
            final c = items[i];
            final participants = List<String>.from(c['participants'] ?? const []);
            final otherId = participants.firstWhere((id) => id != me.id, orElse: () => '');
            final lastText = c['lastText'] ?? '';
            final lastAt = c['lastAt'] as int?; // ms
            final time = lastAt != null
                ? DateTime.fromMillisecondsSinceEpoch(lastAt)
                : null;

            return ListTile(
              leading: const CircleAvatar(child: Icon(Icons.person)),
              title: Text(otherId),
              subtitle: Text(lastText, maxLines: 1, overflow: TextOverflow.ellipsis),
              trailing: time != null ? Text('${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}') : null,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => ChatPage(peerUserId: otherId)),
                );
              },
            );
          },
        );
      },
    );
  }
}
