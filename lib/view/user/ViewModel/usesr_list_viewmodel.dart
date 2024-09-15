import '../../../model/user_model/user_model.dart';

class UserListViewModel {
  final Map<String, List<UserModel>> regionUsers = {
    "おすすめのユーザー": [
      UserModel(name: 'User1', age: 25, gender: '男性', bio: 'プロフィール1'),
      UserModel(name: 'User2', age: 30, gender: '女性', bio: 'プロフィール2'),
      UserModel(name: 'User3', age: 28, gender: 'その他', bio: 'プロフィール3'),
    ],
    "辺野古エイサー": [
      UserModel(name: 'User4', age: 22, gender: '男性', bio: 'プロフィール4'),
      UserModel(name: 'User5', age: 26, gender: '女性', bio: 'プロフィール5'),
    ],
    "全島エイサー": [
      UserModel(name: 'User6', age: 20, gender: '男性', bio: 'プロフィール6'),
      UserModel(name: 'User7', age: 29, gender: '女性', bio: 'プロフィール7'),
      UserModel(name: 'User8', age: 31, gender: '男性', bio: 'プロフィール8'),
      UserModel(name: 'User9', age: 24, gender: '女性', bio: 'プロフィール9'),
    ],
  };
}
