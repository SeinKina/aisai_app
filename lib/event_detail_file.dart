import 'package:flutter/material.dart';

class EventDetailPage extends StatefulWidget {
  final String image;
  final String place;
  final String date;

  const EventDetailPage(
      {super.key, required this.image, required this.place, required this.date});

  @override
  // ignore: library_private_types_in_public_api
  _EventDetailPageState createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  bool _eventCompleted = false; // イベントが完了したかどうかを管理

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('イベント詳細'),
      ),
      body: Column(
        children: [
          Image.asset(widget.image),
          const SizedBox(height: 16),
          Text(
            '開催場所: ${widget.place}',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            '開催日: ${widget.date}',
            style: const TextStyle(fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // ダイアログを表示
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SelectUserDialog(
                      onUserSelected: () {
                        // ユーザーが選択されたら「イベント完了」に表示を変更
                        setState(() {
                          _eventCompleted = true;
                        });
                      },
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50), // ボタンを幅いっぱいにする
              ),
              child: Text(_eventCompleted ? 'イベント完了' : 'イベントへGO'),
            ),
          ),
        ],
      ),
    );
  }
}

class SelectUserDialog extends StatefulWidget {
  final VoidCallback onUserSelected; // ユーザーが選択された時のコールバック

  const SelectUserDialog({super.key, required this.onUserSelected});

  @override
  _SelectUserDialogState createState() => _SelectUserDialogState();
}

class _SelectUserDialogState extends State<SelectUserDialog> {
  int? _selectedUserIndex; // 選択されたユーザーのインデックス

  // 仮のユーザーデータ
  final List<Map<String, String>> users = [
    {'name': '田中 太郎', 'icon': 'assets/image/user1.png'},
    {'name': '山田 花子', 'icon': 'assets/image/user2.png'},
    {'name': '佐藤 次郎', 'icon': 'assets/image/user3.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.black.withOpacity(0.5), // ダイアログの背景を半透明に設定
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              '参加するユーザーを選択',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true, // リストビューが親のサイズに合わせる
              itemCount: users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(users[index]['icon']!),
                  ),
                  title: Text(
                    users[index]['name']!,
                    style: const TextStyle(color: Colors.white),
                  ),
                  trailing: _selectedUserIndex == index
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : null,
                  onTap: () {
                    setState(() {
                      _selectedUserIndex = index; // ユーザーを選択
                    });
                  },
                );
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _selectedUserIndex != null
                  ? () {
                      Navigator.pop(context); // ダイアログを閉じる
                      widget.onUserSelected(); // 選択コールバックを呼び出す
                    }
                  : null, // ユーザーが選択されていない場合は無効
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50), // ボタンを幅いっぱいにする
              ),
              child: const Text('選択する'),
            ),
          ],
        ),
      ),
    );
  }
}
