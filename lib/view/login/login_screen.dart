import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'viewmodel/login_viewmodel.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 250,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          centerTitle: true, // タイトルを中央寄せ
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
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0), // 左右の余白
          child: Consumer<LoginViewModel>(
            builder: (context, viewModel, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center, // 中央寄せ
                crossAxisAlignment: CrossAxisAlignment.stretch, // 子ウィジェットを横方向に最大まで広げる
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shadowColor: const Color.fromARGB(0, 255, 255, 255),
                      minimumSize: const Size(50, 50), // ボタンのサイズを指定
                      padding: EdgeInsets.zero, // 余白をなくす
                    ),
                    onPressed: () {
                      // Googleログインボタンの処理
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
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: viewModel.updateEmail,
                  ),
                  const SizedBox(height: 40),

                  // Password Input Field
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    onChanged: viewModel.updatePassword,
                  ),
                  const SizedBox(height: 40),

                  // Login Button
                  ElevatedButton(
                    onPressed: () {
                      viewModel.login(context); // ログイン処理
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
              );
            },
          ),
        ),
      ),
    );
  }
}
