import 'dart:io';

import 'package:aisai_app/model/user_model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileCreateViewModel with ChangeNotifier {
  final ImagePicker _picker = ImagePicker();
  UserModel user = UserModel(
    uid: '',
    name: '',
    age: 0,
    gender: '男性',
    bio: '',
    email: '',
    password: '',
    profileImagePath: '',
    backgroundImagePath: '',
    questModel: null,
    userLocation: '',
    userOccpation: '',
    youthGroupFlag: false,
    seinennkai: '非会員',  userOccupation: '',
  );

  File? _backgroundImage;
  File? _profileImage;

  File? get backgroundImage => _backgroundImage;
  File? get profileImage => _profileImage;

  Future<void> pickBackgroundImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _backgroundImage = File(pickedFile.path);
      notifyListeners();
    }
  }

  Future<void> pickProfileImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _profileImage = File(pickedFile.path);
      notifyListeners();
    }
  }

  void updateName(String newName) {
    user.name = newName;
    notifyListeners();
  }

  void updateAge(int newAge) {
    user.age = newAge;
    notifyListeners();
  }

  void updateGender(String newGender) {
    user.gender = newGender;
    notifyListeners();
  }

  void updateSeinennkai(String newSeinennkai) {
    user.seinennkai = newSeinennkai;
    notifyListeners();
  }

  void updateBio(String newBio) {
    user.bio = newBio;
    notifyListeners();
  }

  bool validateForm(GlobalKey<FormState> formKey) {
    return formKey.currentState?.validate() ?? false;
  }
}
