import 'package:aisai_app/clear_dialog.dart';
import 'package:flutter/material.dart';

class EventDetailComplete extends StatelessWidget {
  final String image;
  final String place;
  final String date;

  EventDetailComplete(
      {required this.image, required this.place, required this.date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('イベント詳細'),
      ),
      body: Column(
        children: [
          Image.asset(image),
          SizedBox(height: 16),
          Text(
            '開催場所: $place',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            '開催日: $date',
            style: TextStyle(fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return ClearDialog();
                                },
                              );
               
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), // ボタンを幅いっぱいにする
              ),
              child: Text('イベント完了'),
            ),
          ),
        ],
      ),
    );
  }
}


