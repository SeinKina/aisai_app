 import 'package:flutter/material.dart';

 class ClearDialog extends StatefulWidget {
  const ClearDialog({super.key});

  @override
  State<ClearDialog> createState() => _ClearDialogState();
}

class _ClearDialogState extends State<ClearDialog> {
 
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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 16),
           Image.asset('assets/image/hotel.png'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: 
                   () {
                      Navigator.pop(context); // ダイアログを閉じる
                       // 選択コールバックを呼び出す
                    },
                 // ユーザーが選択されていない場合は無効
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
