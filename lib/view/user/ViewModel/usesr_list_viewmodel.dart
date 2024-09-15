import '../../../model/user_model/user_model.dart';

class UserListViewModel {
  final Map<String, List<UserModel>> regionUsers = {
    "おすすめのユーザー": [
      UserModel(
          name: 'たける',
          age: 23,
          gender: '男性',
          bio: 'プロフィール1',
          email: '',
          password: 'password1'),
      UserModel(
          name: 'momo',
          age: 30,
          gender: '女性',
          bio: 'プロフィール2',
          password: 'password2',
          email: ''),
      UserModel(
          name: 'ひよこ',
          age: 28,
          gender: 'その他',
          bio: 'プロフィール3',
          password: 'password3',
          email: ''),
    ],
    "辺野古エイサー": [
      UserModel(
          name: 'nana',
          age: 22,
          gender: '女性',
          bio: 'プロフィール4',
          password: 'password4',
          email: ''),
      UserModel(
          name: 'User5',
          age: 26,
          gender: '女性',
          bio: 'プロフィール5',
          password: 'password5',
          email: ''),
    ],
    "全島エイサー": [
      UserModel(name: 'User9', age: 20, gender: '男性', bio: 'プロフィール9', email: '', password: 'password9'),
      UserModel(name: 'User10', age: 29, gender: '女性', bio: 'プロフィール10', email: '', password: 'password10'),
      UserModel(name: 'User11', age: 31, gender: '男性', bio: 'プロフィール11', email: '', password: 'password11'),
      UserModel(name: 'User12', age: 24, gender: '女性', bio: 'プロフィール12', email: '', password: 'password12'),
    ],
  };
}
