
import '../../../model/user_model/user_model.dart';

class UserProfileViewModel {
  final UserModel user;

  UserProfileViewModel({required this.user});

  String get userName => user.userName;
  String get userAge => '${user.age}歳';
  String get userLocation => '沖縄市'; // 仮の場所
  String get userOccupation => 'エンジニア'; // 仮の職業
  String get eventName => 'エイサー';
  String get eventDate => '2023年10月10日 18:00';
  String get eventLocation => '沖縄市';
}
