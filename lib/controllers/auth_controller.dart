import 'package:flutter/foundation.dart';
import '../models/user.dart';
import '../data/mock_repository.dart';

class AuthController extends ChangeNotifier {
  AppUser? current;

  void signInAsDemo() {
    current = MockRepository.instance.users.first;
    notifyListeners();
  }
}
