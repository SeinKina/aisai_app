import '../../../model/user_model/user_model.dart';

class UserListViewModel {
  final Map<String, List<UserModel>> regionUsers = {
    "おすすめのユーザー": [
      UserModel(
          name: 'User1',
          age: 25,
          gender: '男性',
          bio: 'プロフィール1',
          email: '',
          password: 'password1'),
      UserModel(
          name: 'User2',
          age: 30,
          gender: '女性',
          bio: 'プロフィール2',
          password: 'password2',
          email: ''),
      UserModel(
          name: 'User3',
          age: 28,
          gender: 'その他',
          bio: 'プロフィール3',
          password: 'password3',
          email: ''),
    ],
    "辺野古エイサー": [
      UserModel(
          name: 'User4',
          age: 22,
          gender: '男性',
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
      UserModel(
          name: 'User6',
          age: 20,
          gender: '男性',
          bio: 'プロフィール6',
          password: 'password6',
          email: ''),
      UserModel(
          name: 'User7',
          age: 29,
          gender: '女性',
          bio: 'プロフィール7',
          password: 'password7',
          email: ''),
      UserModel(
          name: 'User8',
          age: 31,
          gender: '男性',
          bio: 'プロフィール8',
          password: 'password8',
          email: ''),
      UserModel(
          name: 'User9',
          age: 24,
          gender: '女性',
          bio: 'プロフィール9',
          password: 'password9',
          email: ''),
    ],
  };
}
