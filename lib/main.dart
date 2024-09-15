import 'package:aisai_app/Login_file.dart';
import 'package:aisai_app/event_detail_complete.dart';
import 'package:firebase_core/firebase_core.dart'; // Firebaseのコアパッケージをインポート
import 'package:flutter/material.dart'; // Flutterのマテリアルパッケージをインポート

import 'firebase_options.dart'; // Firebaseのオプションをインポート

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Flutterウィジェットの初期化を確実にする
  await Firebase.initializeApp(
    options:
        DefaultFirebaseOptions.currentPlatform, // プラットフォーム固有のオプションでFirebaseを初期化
  );
  runApp(MyApp()); // MyAppウィジェットを実行
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<Map<String, String>> event = [
    {'image': 'assets/image/event.jpg', 'place': '東京', 'date': '2024-09-15'},
    {'image': 'assets/image/event.jpg', 'place': '大阪', 'date': '2024-09-16'},
    {'image': 'assets/image/event.jpg', 'place': '京都', 'date': '2024-09-17'},
    {'image': 'assets/image/event.jpg', 'place': '福岡', 'date': '2024-09-18'},
    {'image': 'assets/image/event.jpg', 'place': '札幌', 'date': '2024-09-19'},
    {'image': 'assets/image/event.jpg', 'place': '名古屋', 'date': '2024-09-20'},
    {'image': 'assets/image/event.jpg', 'place': '仙台', 'date': '2024-09-21'},
    {'image': 'assets/image/event.jpg', 'place': '広島', 'date': '2024-09-22'},
    {'image': 'assets/image/event.jpg', 'place': '神戸', 'date': '2024-09-23'},
  ];
  // このウィジェットはアプリケーションのルートです。
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutterデモ', // アプリケーションのタイトル
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.deepPurple), // カラースキームを設定
        useMaterial3: true, // Material 3デザインを使用
      ),
      // home:  const UserPage(), // ホームページを設定
      home: EventDetailComplete(
        image: event[0]['image']!,
        place: event[0]['place']!,
        date: event[0]['date']!,
      ), // ホームページを設定
    );
  }
}
