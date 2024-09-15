class UserModel {
  String name;
  int age;
  String gender;
  String bio;
  String? profileImagePath;
  String? backgroundImagePath;

  final List<String> genders = ['男性', '女性', 'その他'];

  UserModel({
    required this.name,
    required this.age,
    required this.gender,
    required this.bio,
    this.profileImagePath,
    this.backgroundImagePath,
  });
}
