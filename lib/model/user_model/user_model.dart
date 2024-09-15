class UserModel {
  String uid;
  String userName;
  int age;
  String gender;
  String email;
  String password;
  bool youthGroupFlag;
  String? profileImagePath;
  String? backgroundImagePath;
  List<String> genders = ['男性', '女性', 'その他'];

  UserModel({
    required this.uid,
    required this.userName,
    required this.age,
    required this.gender,
    required this.youthGroupFlag,
    this.profileImagePath,
    this.backgroundImagePath,
    required this.email,
    required this.password,
    required String name,
    required String bio,
  });

  set bio(String bio) {}
}
