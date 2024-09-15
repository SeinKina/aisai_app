import 'package:flutter/material.dart';

import '../../user/user_profile_create_screen.dart';

class LoginViewModel with ChangeNotifier {
  String email = '';
  String password = '';

  void updateEmail(String newEmail) {
    email = newEmail;
    notifyListeners();
  }

  void updatePassword(String newPassword) {
    password = newPassword;
    notifyListeners();
  }

  bool validateLogin() {
    // 常に true を返すように変更
    return true;
  }

  void login(BuildContext context) {
    // ログイン処理を削除し、画面遷移だけを行う
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfileCreateScreen()),
    );
  }
}
