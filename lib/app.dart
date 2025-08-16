import 'package:flutter/material.dart';
import 'package:omedia/pages/create_page.dart';
import 'package:omedia/pages/feed_page.dart';
import 'package:omedia/pages/friends_page.dart';
import 'package:omedia/pages/posts_page.dart';
import 'package:omedia/pages/profile_page.dart';

class OMediaApp extends StatefulWidget {
  const OMediaApp({super.key});

  @override
  State<OMediaApp> createState() => _OMediaAppState();
}

class _OMediaAppState extends State<OMediaApp> {
  int _index = 0;
  final _pages = const [
    FeedPage(),
    PostsPage(),
    CreatePage(),
    FriendsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OMedia',
      theme: ThemeData.dark(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text('OMedia')),
        body: _pages[_index],
        bottomNavigationBar: NavigationBar(
          selectedIndex: _index,
          onDestinationSelected: (i) => setState(() => _index = i),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.play_circle_fill), label: 'Akış'),
            NavigationDestination(icon: Icon(Icons.forum), label: 'Gönderiler'),
            NavigationDestination(icon: Icon(Icons.add_box), label: 'Oluştur'),
            NavigationDestination(icon: Icon(Icons.group_add), label: 'Arkadaşlar'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Profil'),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
