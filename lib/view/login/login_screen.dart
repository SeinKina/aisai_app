import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../user/profile_create_screen.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                shadowColor: const Color.fromARGB(0, 255, 255, 255),
                minimumSize: const Size(50, 50), // ボタンのサイズを指定
                padding: EdgeInsets.zero, // 余白をなくす
              ),
              onPressed: () {
                // ボタンが押された時の処理
              },
              child: SizedBox(
                height: 50, // 画像の高さ
                child: SvgPicture.asset(
                  'assets/image/google.svg',
                  fit: BoxFit.contain, // 画像がボタンのサイズに合わせてリサイズされない
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Email Input Field
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 40),

            // Password Input Field
            const TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 40),

            // Login Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfileCreateScreen()));
                // Email/Password login action
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                backgroundColor: const Color.fromARGB(255, 55, 146, 226),
                minimumSize: const Size(double.infinity, 50), // Full width button
              ),
              child: const Text('Login'),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
