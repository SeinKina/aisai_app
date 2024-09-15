import 'package:aisai_app/home_screen.dart';
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
    {
      'image': 'assets/image/eisa/select_eisa_1.jpg',
      'place': '沖縄全島エイサー',
      'date': '2024-09-15'
    },
    {
      'image': 'assets/image/eisa/select_eisa_2.jpg',
      'place': '那覇エイサー',
      'date': '2024-09-16'
    },
    {
      'image': 'assets/image/eisa/select_eisa_3.jpg',
      'place': '首里エイサー',
      'date': '2024-09-17'
    },
    {
      'image': 'assets/image/eisa/select_eisa_4.jpg',
      'place': '読谷エイサー',
      'date': '2024-09-18'
    },
    {
      'image': 'assets/image/eisa/select_eisa_5.jpg',
      'place': '名護エイサー',
      'date': '2024-09-19'
    },
    {
      'image': 'assets/image/eisa/select_eisa_6.jpg',
      'place': '石垣島エイサー',
      'date': '2024-09-20'
    },
    {
      'image': 'assets/image/eisa/select_eisa_7.jpg',
      'place': '宮古島エイサー',
      'date': '2024-09-21'
    },
    {
      'image': 'assets/image/eisa/select_eisa_8.jpg',
      'place': 'うるま市エイサー',
      'date': '2024-09-22'
    },
    {
      'image': 'assets/image/eisa/select_eisa_9.jpg',
      'place': '宜野湾エイサー',
      'date': '2024-09-23'
    },
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
                  crossAxisCount: 2, // 1行に2つ表示
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
                                    fontSize: 18, // 文字の大きさを調整
                                  ),
                                ),
                                Text(
                                  event[index]['date']!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16, // 文字の大きさを調整
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()), // ホーム画面に遷移
                      );
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
