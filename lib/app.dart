import 'package:aisai_app/chat_page.dart';
import 'package:aisai_app/home_screen.dart';
import 'package:aisai_app/top/top_page.dart';
import 'package:aisai_app/view/event/event_list_screen.dart';
import 'package:aisai_app/view/mypage/viewmodel/my_profile_screen_viewmodel.dart';
import 'package:flutter/material.dart';

import 'view/login/login_screen.dart';
import 'view/mypage/my_profile_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aisai',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 255, 122, 237)),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
      routes: {
        '/home': (context) => const HomeScreen(), // ホーム画面のルート
        '/eventlist': (context) => const EventListScreen(), // イベント一覧画面のルート
        '/top': (context) => UserProfileSlider(),
        '/myprofile': (context) => MyProfileScreen(
              viewModel: MyProfileScreenViewModel(
                  userName: 'John Doe',
                  userAge: 30,
                  userLocation: 'Tokyo',
                  userOccupation: 'Engineer',
                  eventName: 'Tech Conference',
                  eventDate: DateTime.now().toIso8601String(),
                  eventLocation: 'Tokyo International Forum'),
              userName: '',
              userLocation: '',
              userOccupation: '',
              eventName: '',
              eventDate: '',
              userAge: 0,
              eventLocation: '',
            ), // マイプ
        '/chat': (context) => ChatPage(
              userName: '',
              userImage: '',
            ), // マイプロフィール画面ロフィール画面
      },
    );
  }
}
