import 'package:aisai_app/user_page.dart';
import 'package:aisai_app/home_page.dart';
import 'package:firebase_core/firebase_core.dart'; // Firebaseのコアパッケージをインポート
import 'package:flutter/material.dart'; // Flutterのマテリアルパッケージをインポート

import 'firebase_options.dart'; // Firebaseのオプションをインポート

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Flutterウィジェットの初期化を確実にする
  await Firebase.initializeApp(
    options:
        DefaultFirebaseOptions.currentPlatform, // プラットフォーム固有のオプションでFirebaseを初期化
  );
  runApp(const MyApp()); // MyAppウィジェットを実行
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: const MyHomePage(title: 'Flutterデモ'), // ホームページを設定
    );
  }
}
