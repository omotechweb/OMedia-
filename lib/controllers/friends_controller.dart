import 'package:flutter/foundation.dart';
import '../models/user.dart';
import '../data/mock_repository.dart';

class FriendsController extends ChangeNotifier {
  final _repo = MockRepository.instance;

  List<AppUser> get allUsers => _repo.users;

  void addFriend(String userId) {
    // Mock: sadece notify ediyoruz
    notifyListeners();
  }
}
