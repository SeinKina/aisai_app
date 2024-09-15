import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class EventDetailComplete extends StatefulWidget {
  final String image;
  final String place;
  final String date;

  const EventDetailComplete(
      {super.key, required this.image, required this.place, required this.date});

  @override
  _EventDetailCompleteState createState() => _EventDetailCompleteState();
}

class _EventDetailCompleteState extends State<EventDetailComplete> {
  late ConfettiController _confettiController; // 紙吹雪コントローラー

  @override
  void initState() {
    super.initState();
    // ConfettiControllerの初期化
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 2)); // 2秒間の紙吹雪
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  void _showClearDialog() {
    // 紙吹雪アニメーションを再生
    _confettiController.play();
    // ダイアログを表示
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Stack(
          children: [
            // ダイアログ
            const Center(
              child: ClearDialog(),
            ),
            // 紙吹雪アニメーションをダイアログの上に配置
            Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: _confettiController,
                blastDirection: -3.14 / 2, // 紙吹雪を上方向に噴出
                emissionFrequency: 0.05, // 紙吹雪の頻度
                numberOfParticles: 30, // 紙吹雪の量
                gravity: 0.3, // 紙吹雪がゆっくり落ちる
                shouldLoop: false, // アニメーションをループさせない
              ),
            ),
          ],
        );
      },
    );
  }

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
              onPressed: _showClearDialog, // ダイアログと紙吹雪を表示
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50), // ボタンを幅いっぱいにする
              ),
              child: const Text('イベント完了'),
            ),
          ),
        ],
      ),
    );
  }
}

class ClearDialog extends StatelessWidget {
  const ClearDialog({super.key});

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
              'クリア！',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 16),
            Image.asset('assets/image/hotel.png'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // ダイアログを閉じる
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50), // ボタンを幅いっぱいにする
              ),
              child: const Text('戻る'),
            ),
          ],
        ),
      ),
    );
  }
}
