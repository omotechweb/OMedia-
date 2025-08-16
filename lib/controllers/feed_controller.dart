import 'package:flutter/foundation.dart';
import '../models/video_item.dart';
import '../data/mock_repository.dart';

class FeedController extends ChangeNotifier {
  final _repo = MockRepository.instance;

  List<VideoItem> get videos => _repo.videos;
}
