import 'package:aisai_app/view/user/ViewModel/usesr_list_viewmodel.dart';
import 'package:flutter/material.dart';

import '../../model/user_model/user_model.dart';
import 'user_profile_screen.dart'; // UserProfileScreenのインポート
import 'viewmodel/user_profile_viewmodel.dart';

class UserListScreen extends StatelessWidget {
  final String title; // タイトルを受け取るプロパティ
  final UserListViewModel viewModel = UserListViewModel(); // ViewModelをインスタンス化

  UserListScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: viewModel.regionUsers.entries.map((entry) {
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
                                  CircleAvatar(
                                    radius: 40.0, // アイコンのサイズを少し大きくする
                                    backgroundImage: AssetImage(
                                        'assets/image/user_placeholder.png'), // プレースホルダー画像
                                  ),
                                  SizedBox(height: 8.0),
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
