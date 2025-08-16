import 'package:flutter/foundation.dart';
import '../models/post.dart';
import '../data/mock_repository.dart';

class PostsController extends ChangeNotifier {
  final _repo = MockRepository.instance;

  List<Post> get posts => _repo.posts;

  void createPost(Post post) {
    _repo.posts.add(post);
    notifyListeners();
  }
}
