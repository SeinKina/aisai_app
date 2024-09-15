import 'package:aisai_app/view/user/ViewModel/usesr_list_viewmodel.dart';
import 'package:flutter/material.dart';

import '../../model/user_model/user_model.dart';
import 'user_profile_screen.dart'; // UserProfileScreenのインポート
import 'viewmodel/user_profile_viewmodel.dart';

class UserListScreen extends StatefulWidget {
  final String title;
  UserListScreen({super.key, required this.title});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {

  late List<UserModel> users = [];
  final UserListViewModel viewModel = UserListViewModel();
  bool isLoading = true;
  String? errorMessage;

  late Map<String, List<UserModel>> regionUsers;

  @override
  void initState() {
    super.initState();
    fetchUsers();
    regionUsers = {
      "おすすめのユーザー": users,
      "辺野古エイサー": users,
      "全島エイサー": users,
    };
  }

  Future<void> fetchUsers() async {
    try {
      await viewModel.getUsers();
      setState(() {
        users = viewModel.users;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'データの取得に失敗しました: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: regionUsers.entries.map((entry) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  entry.key,
                  style: const TextStyle(
                      fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 150.0, // 高さを少し広くして、より多くのユーザーを表示
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: entry.value.length,
                  itemBuilder: (context, index) {
                    UserModel user = entry.value[index]; // UserModelのインスタンスを取得
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SizedBox(
                        width: 120.0, // 幅を少し広くして、ユーザー情報を見やすくする
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UserProfileScreen(
                                  user: user,
                                  viewModel: UserProfileViewModel(user: user),
                                ),
                              ),
                            );
                          },
                          child: Card(
                            elevation: 5, // カードに影を付けて視覚的に強調
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const CircleAvatar(
                                    radius: 40.0, // アイコンのサイズを少し大きくする
                                    backgroundImage: AssetImage(
                                        'assets/image/event_background.jpg'), // プレースホルダー画像
                                  ),
                                  const SizedBox(height: 8.0),
                                  Text(
                                    user.name,
                                    style: const TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.center,
                                  ), // ユーザー名を表示
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
