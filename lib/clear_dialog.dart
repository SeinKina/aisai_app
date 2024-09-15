import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class EventDetailPage extends StatefulWidget {
  @override
  _EventDetailPageState createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage>
    with SingleTickerProviderStateMixin {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 紙吹雪アニメーション
          Align(
            alignment: Alignment.topCenter, // 画面中央上部に配置
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
            Text(
              'クリア！',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 16),
            Image.asset('assets/image/hotel.png'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // ダイアログを閉じる
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), // ボタンを幅いっぱいにする
              ),
              child: Text('戻る'),
            ),
          ],
        ),
      ),
    );
  }
}
