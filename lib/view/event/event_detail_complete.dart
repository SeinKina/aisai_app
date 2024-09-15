import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

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
      body: SingleChildScrollView(
        // ここでスクロール可能に
        child: Column(
          children: [
            Image.asset(widget.image),
            SizedBox(height: 16),
            Text(
              '開催場所: ${widget.place}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              '開催日: ${widget.date}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 30),
            Text(
              '「沖縄全島エイサーまつり」は、毎年旧盆明けの最初の週末に行われる、1956年の「コザ市誕生」を機に「全島エイサーコンクール」としてスタートし、今では沖縄の夏の風物詩として日本を代表する「まつり」の一つとなりました。\n\n'
              '「まつり」には本島各地から選抜された青年会などの団体や、全国の姉妹都市や協賛団体からのゲストが集結します。会場に鳴り響く三線、歌、太鼓のリズムに酔いしれ、その迫力あるバチさばきに感動しながら、本場のエイサーのだいご味を思う存分味わうことが出来る一大イベントです。\n\n'
              'まつりは3日間に渡り、金曜日のまつり初日には、国道330号コザ・ゲート通りでの「みちじゅねー」、そして土曜日の中日が沖縄市青年団協議会による「沖縄市青年まつり」日曜日が「本祭」として、全島から集められた青年会による、エイサー大会が沖縄市コザ運動公園で開催されます。\n\n'
              'また、運動公園サブグラウンドで同時開催される「ビアフェスト」との相乗効果で会場周辺では、夜遅くまで祭りの賑わいが続きます。',
              style: TextStyle(fontSize: 16), // 文字サイズを調整
              textAlign: TextAlign.justify, // テキストを左右に整列
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: _showClearDialog, // ダイアログと紙吹雪を表示
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50), // ボタンを幅いっぱいにする
                ),
                child: Text('イベント完了'),
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
