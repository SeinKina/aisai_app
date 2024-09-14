import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'profile_create_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 250,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        centerTitle: true, // タイトルを中央寄せ
        title: const Column(
          mainAxisSize: MainAxisSize.min,
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 10),
            Text(
              'AISAI',
              style: TextStyle(
                color: Color.fromARGB(255, 236, 97, 144),
                fontSize: 65, // フォントサイズを大きく
                fontWeight: FontWeight.bold, // 文字を太く
              ),
            ),
            Text(
              'Login',
              style: TextStyle(
                fontSize: 20, // フォントサイズを大きく
                fontWeight: FontWeight.bold, // 文字を太く
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0), // 左右の余白
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 中央寄せ
          crossAxisAlignment: CrossAxisAlignment.stretch, // 子ウィジェットを横方向に最大まで広げる
          children: [
            // Google Login Button
            // Google Login Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shadowColor: Color.fromARGB(0, 255, 255, 255),
                minimumSize: Size(50, 50), // ボタンのサイズを指定
                padding: EdgeInsets.zero, // 余白をなくす
              ),
              onPressed: () {
                // ボタンが押された時の処理
              },
              child: Container(
                height: 50, // 画像の高さ
                child: SvgPicture.asset(
                  'assets/image/google.svg',
                  fit: BoxFit.contain, // 画像がボタンのサイズに合わせてリサイズされない
                ),
              ),
            ),
            SizedBox(height: 40),

            // Email Input Field
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 40),

            // Password Input Field
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 40),

            // Login Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterScreen()));
                // Email/Password login action
              },
              child: Text('Login'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Color.fromARGB(255, 255, 255, 255),
                backgroundColor: Color.fromARGB(255, 55, 146, 226),
                minimumSize: Size(double.infinity, 50), // Full width button
              ),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
