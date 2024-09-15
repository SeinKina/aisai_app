import 'package:aisai_app/chat_page.dart';
import 'package:flutter/material.dart';

class DMListPage extends StatefulWidget {
  @override
  _DMListPageState createState() => _DMListPageState();
}

class _DMListPageState extends State<DMListPage> {
  // 仮のDMデータ
  List<Map<String, dynamic>> dmList = [
    {
      'name': '田中 太郎',
      'icon': 'assets/image/user1.png',
      'lastMessageTime': DateTime.now().subtract(Duration(minutes: 10))
    },
    {
      'name': '山田 花子',
      'icon': 'assets/image/user2.png',
      'lastMessageTime': DateTime.now().subtract(Duration(hours: 1))
    },
    {
      'name': '佐藤 次郎',
      'icon': 'assets/image/user3.png',
      'lastMessageTime': DateTime.now().subtract(Duration(days: 1))
    },
  ];

  @override
  Widget build(BuildContext context) {
    // 直近で話したユーザーをリストの一番上に並べ替える
    dmList.sort((a, b) => b['lastMessageTime'].compareTo(a['lastMessageTime']));

    return Scaffold(
      appBar: AppBar(
        title: Text('DM一覧'),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: dmList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(dmList[index]['icon']),
            ),
            title: Text(dmList[index]['name']),
            subtitle: Text(
              'Last message: ${dmList[index]['lastMessageTime']}',
              style: TextStyle(color: Colors.grey),
            ),
            onTap: () {
              // DM詳細ページへ遷移する処理を書く
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(
                    userName: dmList[index]['name'],
                    userImage: '',
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
