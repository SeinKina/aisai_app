import 'package:flutter/material.dart';

class EventSelectScreen extends StatefulWidget {
  const EventSelectScreen({super.key});

  @override
  EventSelectScreenState createState() => EventSelectScreenState();
}

class EventSelectScreenState extends State<EventSelectScreen> {
  int? _selectedEventIndex; // 選択されたイベントのインデックス

  // イベント情報（仮のデータ）
  final List<Map<String, String>> event = [
    {'image': 'assets/image/event.jpg', 'place': '東京', 'date': '2024-09-15'},
    {'image': 'assets/image/event.jpg', 'place': '大阪', 'date': '2024-09-16'},
    {'image': 'assets/image/event.jpg', 'place': '京都', 'date': '2024-09-17'},
    {'image': 'assets/image/event.jpg', 'place': '福岡', 'date': '2024-09-18'},
    {'image': 'assets/image/event.jpg', 'place': '札幌', 'date': '2024-09-19'},
    {'image': 'assets/image/event.jpg', 'place': '名古屋', 'date': '2024-09-20'},
    {'image': 'assets/image/event.jpg', 'place': '仙台', 'date': '2024-09-21'},
    {'image': 'assets/image/event.jpg', 'place': '広島', 'date': '2024-09-22'},
    {'image': 'assets/image/event.jpg', 'place': '神戸', 'date': '2024-09-23'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('イベント選択'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 1行に3つ表示
                  crossAxisSpacing: 16.0, // ボックス間のスペースを広げる
                  mainAxisSpacing: 16.0, // ボックス間のスペースを広げる
                  childAspectRatio: 0.8, // イベントボックスの縦横比を調整して大きくする
                ),
                itemCount: event.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedEventIndex = index; // イベントを選択
                      });
                    },
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: _selectedEventIndex == index
                                  ? Colors.blue
                                  : Colors.grey, // 選択された場合は青い枠
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: AssetImage(event[index]['image']!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        // チェックマークの表示
                        if (_selectedEventIndex == index)
                          const Positioned(
                            top: 8,
                            right: 8,
                            child: Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 30,
                            ),
                          ),
                        // イベントの場所と日付を表示
                        Positioned(
                          bottom: 8,
                          left: 8,
                          right: 8,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  event[index]['place']!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  event[index]['date']!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _selectedEventIndex != null
                  ? () {
                      Navigator.pushReplacementNamed(context, '/home'); // ホーム画面に遷移
                    }
                  : null, // イベントが選択されていないときは無効
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50), // ボタンを幅いっぱいにする
              ),
              child: const Text('次へ'),
            ),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
