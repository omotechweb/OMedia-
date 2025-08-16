import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/auth_controller.dart';
import 'controllers/posts_controller.dart';
import 'controllers/feed_controller.dart';
import 'controllers/friends_controller.dart';
import 'controllers/chat_controller.dart';
import 'pages/feed_page.dart';
import 'pages/create_page.dart';
import 'pages/friends_page.dart';
import 'pages/profile_page.dart';
import 'pages/chat_page.dart';
import 'pages/posts_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => PostsController()),
        ChangeNotifierProvider(create: (_) => FeedController()),
        ChangeNotifierProvider(create: (_) => FriendsController()),
        ChangeNotifierProvider(create: (_) => ChatController()),
      ],
      child: MaterialApp(
        title: 'Omedia Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: FeedPage(),
      ),
    );
  }
}
