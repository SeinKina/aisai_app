import '../../../model/user_model/user_model.dart';

class UserListViewModel {
  final Map<String, List<UserModel>> regionUsers = {
    "おすすめのユーザー": [
      UserModel(name: 'User1', age: 25, gender: '男性', bio: 'プロフィール1', email: '', password: 'password1'),
      UserModel(name: 'User2', age: 30, gender: '女性', bio: 'プロフィール2', email: '', password: 'password2'),
      UserModel(name: 'User3', age: 28, gender: 'その他', bio: 'プロフィール3', email: '', password: 'password3'),
      UserModel(name: 'User4', age: 22, gender: '男性', bio: 'プロフィール4', email: '', password: 'password4'),
      UserModel(name: 'User5', age: 26, gender: '女性', bio: 'プロフィール5', email: '', password: 'password5'),
    ],
    "辺野古エイサー": [
      UserModel(name: 'User6', age: 22, gender: '男性', bio: 'プロフィール6', email: '', password: 'password6'),
      UserModel(name: 'User7', age: 26, gender: '女性', bio: 'プロフィール7', email: '', password: 'password7'),
      UserModel(name: 'User8', age: 24, gender: '男性', bio: 'プロフィール8', email: '', password: 'password8'),
    ],
    "全島エイサー": [
      UserModel(name: 'User9', age: 20, gender: '男性', bio: 'プロフィール9', email: '', password: 'password9'),
      UserModel(name: 'User10', age: 29, gender: '女性', bio: 'プロフィール10', email: '', password: 'password10'),
      UserModel(name: 'User11', age: 31, gender: '男性', bio: 'プロフィール11', email: '', password: 'password11'),
      UserModel(name: 'User12', age: 24, gender: '女性', bio: 'プロフィール12', email: '', password: 'password12'),
    ],
  };
}
