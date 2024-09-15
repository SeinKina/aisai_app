import 'package:aisai_app/model/user_model/user_model.dart';
import 'package:flutter/material.dart';

import '../../user/user_profile_create_screen.dart';

class LoginViewModel with ChangeNotifier {
  UserModel user = UserModel(
    name: '',
    age: 0, // Provide a default value for age
    gender: '',
    bio: '',
    email: '',
    password: '',
  ); // Initialize UserModel

  void updateEmail(String newEmail) {
    user.email = newEmail;
    notifyListeners();
  }

  void updatePassword(String newPassword) {
    user.password = newPassword;
    notifyListeners();
  }

  bool validateLogin() {
    // Always return true for now
    return true;
  }

  void login(BuildContext context) {
    // Remove login processing and just navigate to the profile create screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfileCreateScreen()),
    );
  }
}
