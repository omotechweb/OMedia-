import '../models/user.dart';
import '../models/post.dart';
import '../models/video_item.dart';
import '../models/message.dart';

class MockRepository {
  static final MockRepository instance = MockRepository._internal();
  MockRepository._internal();

  final List<AppUser> users = [
    AppUser(
      id: 'u1',
      name: 'Ali Veli',
      username: 'aliveli',
      age: 25,
      email: 'ali@example.com',
      avatarUrl: 'https://i.pravatar.cc/150?img=1',
    ),
    AppUser(
      id: 'u2',
      name: 'Ayşe Fatma',
      username: 'aysefatma',
      age: 22,
      email: 'ayse@example.com',
      avatarUrl: 'https://i.pravatar.cc/150?img=2',
    ),
  ];

  final List<Post> posts = [
    Post(
      id: 'p1',
      authorName: 'Ali Veli',
      authorAvatar: 'https://i.pravatar.cc/150?img=1',
      content: 'İlk gönderim!',
    ),
    Post(
      id: 'p2',
      authorName: 'Ayşe Fatma',
      authorAvatar: 'https://i.pravatar.cc/150?img=2',
      content: 'Merhaba dünya!',
    ),
  ];

  final List<VideoItem> videos = [
    VideoItem(
      id: 'v1',
      url: 'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
      authorName: 'Ali Veli',
      caption: 'Harika bir video!',
    ),
  ];

  final List<Message> messages = [];
}
