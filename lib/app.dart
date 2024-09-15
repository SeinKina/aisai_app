import 'package:aisai_app/home_screen.dart';
import 'package:aisai_app/view/event/event_select_screen.dart';
import 'package:flutter/material.dart';
import 'view/login/login_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aisai',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
      routes: {
        '/home': (context) => const HomeScreen(), // ホーム画面のルート
        '/eventSelect': (context) => const EventSelectScreen(), // イベント選択画面
      },
    );
  }
}
