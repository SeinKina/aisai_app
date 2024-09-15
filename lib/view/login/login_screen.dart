import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:aisai_app/view/user/user_profile_create_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Googleサインインメソッド
  Future<User?> _signInWithGoogle() async {
    try {
      // Googleサインインフローを開始
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        // サインインキャンセル
        return null;
      }

      // Google認証情報の取得
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // FirebaseにGoogleの認証情報を渡す
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Firebase認証でGoogleアカウントでログイン
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      print('Googleサインイン失敗: $e');
      return null;
    }
  }

  // サインアウトメソッド
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 250,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        centerTitle: true,
        title: const Column(
          mainAxisSize: MainAxisSize.min,
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Google Login Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shadowColor: const Color.fromARGB(0, 255, 255, 255),
                minimumSize: const Size(50, 50), // ボタンのサイズを指定
                padding: EdgeInsets.zero, // 余白をなくす
              ),
              onPressed: () async {
                // Googleログイン処理
                User? user = await _signInWithGoogle();
                if (user != null) {
                  print('サインインに成功: ${user.displayName}');
                  // プロフィール作成画面へ遷移
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileCreateScreen(),
                    ),
                  );
                }
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
                // 通常のEmail/Password login処理
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfileCreateScreen()));
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                backgroundColor: const Color.fromARGB(255, 55, 146, 226),
                minimumSize:
                    const Size(double.infinity, 50), // Full width button
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
