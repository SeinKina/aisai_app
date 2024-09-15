
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../model/user_model/user_model.dart';

class UserProfileViewModel {
  final UserModel user;

  UserProfileViewModel({required this.user}){
    docRef = db.collection('users');
  }

  FirebaseFirestore db = FirebaseFirestore.instance;
  late final CollectionReference docRef;
  late List<UserModel> users;

  // ユーザー一覧を取得する
  Future<void> getUsers() async {
    final querySnapshot = await docRef.get();
    
    users = querySnapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return UserModel(
        uid: data['uid'],
        name: data['name'],
        age: data['age'],
        gender: data['gender'],
        bio: data['bio'],
        profileImagePath: data['profileImagePath'],
        backgroundImagePath: data['backgroundImagePath'],
        questModel: data['questModel'],
        userLocation: data['userLocation'],
        userOccpation: data['userOccpation'],
        youthGroupFlag: data['youthGroupFlag'],
        email: data['email'],
        password: data['password'],
      );
    }).toList();
  }

  // String get userName => user.name;
  // String get userAge => '${user.age}歳';
  // String get userLocation => '沖縄市'; // 仮の場所
  // String get userOccupation => 'エンジニア'; // 仮の職業
  // String get eventName => 'エイサー';
  // String get eventDate => '2023年10月10日 18:00';
  // String get eventLocation => '沖縄市';
}
