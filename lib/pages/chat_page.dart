import 'package:flutter/material.dart';
import 'package:omedia/controllers/auth_controller.dart';
import 'package:omedia/controllers/chat_controller.dart';
import 'package:omedia/models/message.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  final String peerUserId;
  const ChatPage({super.key, required this.peerUserId});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _input = TextEditingController();
  final _scroll = ScrollController();

  @override
  Widget build(BuildContext context) {
    final me = context.watch<AuthController>().current;
    if (me == null) {
      return const Scaffold(
        body: Center(child: Text('Önce giriş yapmalısın')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Sohbet • ${widget.peerUserId}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<Message>>(
              stream: context.read<ChatController>().streamMessages(me.id, widget.peerUserId),
              builder: (_, snap) {
                if (!snap.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                final messages = snap.data!;
                return ListView.builder(
                  controller: _scroll,
                  reverse: true, // son mesaj altta
                  itemCount: messages.length,
                  itemBuilder: (_, i) {
                    final m = messages[i];
                    final isMine = m.senderId == me.id;
                    return Align(
                      alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: isMine ? Colors.blueAccent : Colors.grey.shade800,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(m.text),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 6, 8, 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _input,
                      decoration: const InputDecoration(
                        hintText: 'Mesaj yaz...',
                        border: OutlineInputBorder(),
                        isDense: true,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () async {
                      final txt = _input.text.trim();
                      if (txt.isEmpty) return;
                      await context.read<ChatController>().send(
                        from: me.id,
                        to: widget.peerUserId,
                        text: txt,
                      );
                      _input.clear();
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
