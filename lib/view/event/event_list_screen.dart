import 'package:flutter/material.dart';

import 'event_detail_file.dart';

class EventListScreen extends StatefulWidget {
  const EventListScreen({super.key});

  @override
  EventListScreenState createState() => EventListScreenState();
}

class EventListScreenState extends State<EventListScreen> {
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
      appBar: AppBar(title: Text("イベント一覧")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 1行に3つ表示
            crossAxisSpacing: 16.0, // ボックス間のスペースを広げる
            mainAxisSpacing: 16.0, // ボックス間のスペースを広げる
            childAspectRatio: 0.8, // イベントボックスの縦横比
          ),
          itemCount: event.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // 詳細ページへの遷移
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EventDetailPage(
                      image: event[index]['image']!, // 必要な引数を渡す
                      place: event[index]['place']!,
                      date: event[index]['date']!,
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage(event[index]['image']!),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
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
              ),
            );
          },
        ),
      ),
    );
  }
}
