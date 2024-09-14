import 'package:aisai_app/app.dart';
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
