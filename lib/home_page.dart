import 'package:aisai_app/user_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title; // ホームページのタイトル

  @override
  State<MyHomePage> createState() => _MyHomePageState(); // ホームページの状態を作成
}

class _MyHomePageState extends State<MyHomePage> {
  final Map<String, List<String>> regionUsers = {
    "おすすめのユーザー": ["User1", "User2", "User3"],
    "辺野古エイサー": ["User4", "User5"],
    "全島エイサー": ["User6", "User7", "User8", "User9"]
  }; // 地域ごとのユーザーリスト

  @override
  Widget build(BuildContext context) {
    // このメソッドはsetStateが呼び出されるたびに再実行されます。
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView(
        children: regionUsers.entries.map((entry) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start, // 子ウィジェットを左寄せに設定
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  entry.key,
                  style: const TextStyle(fontSize: 20.0), // テキストの大きさを指定
                ),
              ),
              SizedBox(
                height: 120.0, // ListViewの高さを指定
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: entry.value.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: SizedBox(
                        width: 100.0, // Cardの幅を指定
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const UserPage(),
                              ),
                            );
                          },
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  const CircleAvatar(
                                    radius: 30.0, // CircleAvatarの半径を指定
                                    child: Icon(Icons.person, size: 25.0),
                                  ),
                                  const SizedBox(
                                      height: 8.0), // アイコンとテキストの間にスペースを追加
                                  Text(entry.value[index]), // ユーザー名を表示
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
