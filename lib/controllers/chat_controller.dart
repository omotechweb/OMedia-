import 'package:flutter/foundation.dart';
import '../models/message.dart';
import '../data/mock_repository.dart';

class ChatController extends ChangeNotifier {
  final _repo = MockRepository.instance;

  List<Message> streamMessages(String senderId, String receiverId) {
    return _repo.messages.where((m) =>
      (m.senderId == senderId && m.receiverId == receiverId) ||
      (m.senderId == receiverId && m.receiverId == senderId)
    ).toList();
  }

  void send(String senderId, String receiverId, String text) {
    final message = Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      senderId: senderId,
      receiverId: receiverId,
      text: text,
    );
    _repo.messages.add(message);
    notifyListeners();
  }
}
