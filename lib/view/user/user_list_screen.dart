import 'package:flutter/material.dart';
import '../../model/user_model/user_model.dart';
import 'ViewModel/user_profile_viewmodel.dart';
import 'ViewModel/usesr_list_viewmodel.dart';
import 'user_profile_screen.dart'; // UserProfileScreenのインポート

class UserListScreen extends StatelessWidget {
  final String title; // タイトルを受け取るプロパティ
  final UserListViewModel viewModel = UserListViewModel(); // ViewModelをインスタンス化

  UserListScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: ListView(
        children: viewModel.regionUsers.entries.map((entry) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  entry.key,
                  style: const TextStyle(fontSize: 20.0),
                ),
              ),
              SizedBox(
                height: 120.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: entry.value.length,
                  itemBuilder: (context, index) {
                    UserModel user = entry.value[index]; // UserModelのインスタンスを取得
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: SizedBox(
                        width: 100.0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UserProfileScreen(user: user, viewModel: UserProfileViewModel(user: user)),
                              ),
                            );
                          },
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  const CircleAvatar(
                                    radius: 30.0,
                                    child: Icon(Icons.person, size: 25.0),
                                  ),
                                  const SizedBox(height: 8.0),
                                  Text(user.name), // ユーザー名を表示
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
