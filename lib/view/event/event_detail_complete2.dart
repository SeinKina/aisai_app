import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
 
class EventDetailComplete2 extends StatefulWidget {
  final String image;
  final String place;
  final String date;
 
  const EventDetailComplete2(
      {super.key,
      required this.image,
      required this.place,
      required this.date});
 
  @override
  _EventDetailComplete2State createState() => _EventDetailComplete2State();
}
 
class _EventDetailComplete2State extends State<EventDetailComplete2> {
  late ConfettiController _confettiController;
  final TextEditingController _descriptionController = TextEditingController();
 
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
    _descriptionController.dispose();
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
            const Center(
              child: ClearDialog(),
            ),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/image/hakkasonn.png'),
            const SizedBox(height: 16),
            const Text(
              '開催場所: 名護マルチメディア館',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              '開催日: 2024-09-16',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '\nアプリ開発イベント',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  // テキスト入力フィールド
                  TextField(
                    controller: _descriptionController,
                    maxLines: 5, // 最大行数を設定
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText:
                            'このイベントは、プログラミング初心者から経験者まで、学生であればどなたでもご参加いただけます。\n'
                            '\nやんばるハッカソン\n'
                            '\n沖縄県の高校・高専・大学に通う学生が対象です。'
                            '\n特に未経験でも歓迎で、最もハッカソン中に成長した方を評価します。\n'
                            '\nハックツハッカソン\n'
                            '\n全国の高校・高専・大学に通う学生が対象です。\n'
                            '特に技術が好きな方が歓迎で、技術の無駄遣いを追求した方を評価します。\n'
                            '参加登録時に自分が参加したい側のハッカソンを選択ください。\n'
                            '\n沖縄の学生はどちらのハッカソンに参加してもOKです。\n'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: _showClearDialog,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50), // ボタンを幅いっぱいにする
                ),
                child: const Text('イベント完了'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 
class ClearDialog extends StatelessWidget {
  const ClearDialog({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.black.withOpacity(0.5),
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
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('戻る'),
            ),
          ],
        ),
      ),
    );
  }
}