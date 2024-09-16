import 'dart:async';

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
  late Timer _timer;
  int _remainingTime = 10; // 残り時間（秒）
 
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
 
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer.cancel(); // タイマーを停止
          _showFailureDialog(); // イベント失敗のダイアログを表示
        }
      });
    });
  }
 
  void _showFailureDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Center(
          child: FailureDialog(),
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
            const SizedBox(height: 30),
            const Text(
              '「沖縄全島エイサーまつり」は、毎年旧盆明けの最初の週末に行われる、1956年の「コザ市誕生」を機に「全島エイサーコンクール」としてスタートし、今では沖縄の夏の風物詩として日本を代表する「まつり」の一つとなりました。\n\n'
              '「まつり」には本島各地から選抜された青年会などの団体や、全国の姉妹都市や協賛団体からのゲストが集結します。会場に鳴り響く三線、歌、太鼓のリズムに酔いしれ、その迫力あるバチさばきに感動しながら、本場のエイサーのだいご味を思う存分味わうことが出来る一大イベントです。\n\n'
              'まつりは3日間に渡り、金曜日のまつり初日には、国道330号コザ・ゲート通りでの「みちじゅねー」、そして土曜日の中日が沖縄市青年団協議会による「沖縄市青年まつり」日曜日が「本祭」として、全島から集められた青年会による、エイサー大会が沖縄市コザ運動公園で開催されます。\n\n'
              'また、運動公園サブグラウンドで同時開催される「ビアフェスト」との相乗効果で会場周辺では、夜遅くまで祭りの賑わいが続きます。',
              style: TextStyle(fontSize: 16), // 文字サイズを調整
              textAlign: TextAlign.justify, // テキストを左右に整列
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  _startTimer(); // カウントダウンを開始
                  _showFailureDialog(); // ダイアログを表示
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50), // ボタンを幅いっぱいにする
                ),
                child: const Text('イベント開始'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 
class FailureDialog extends StatefulWidget {
  const FailureDialog({super.key});
 
  @override
  _FailureDialogState createState() => _FailureDialogState();
}
 
class _FailureDialogState extends State<FailureDialog> {
  bool _showCrossMark = false;
  late Timer _crossMarkTimer;
  int _remainingTime = 10; // 10秒のカウントダウン
 
  @override
  void initState() {
    super.initState();
    _startCountdown();
  }
 
  void _startCountdown() {
    _crossMarkTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _crossMarkTimer.cancel();
          _showCrossMark = true; // バツマークを表示する
        }
      });
    });
  }
 
  @override
  void dispose() {
    _crossMarkTimer.cancel();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.black.withOpacity(0.5), // ダイアログの背景を半透明に設定
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_remainingTime > 0)
              Text(
                '残り時間: $_remainingTime 秒',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )
            else
              const Text(
                'イベント失敗！',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            const SizedBox(height: 16),
            AnimatedCrossFade(
              firstChild: const SizedBox.shrink(),
              secondChild: const Icon(
                Icons.close,
                color: Colors.red,
                size: 100,
              ),
              crossFadeState: _showCrossMark
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(seconds: 1),
            ),
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