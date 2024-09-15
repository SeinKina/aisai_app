import 'dart:math';

import 'package:geolocator/geolocator.dart';

import '../../../model/eventmodel/event_model.dart';
import '../../../model/user_model/user_model.dart';

class EventDetailViewModel {
  final EventModel event;
  bool isEventCompleted = false;

  EventDetailViewModel({required this.event});

  // 現在位置の記憶用
  late Position _currentPosition; // 追加

  double distanceBetween(
  double latitude1,
  double longitude1,
  double latitude2,
  double longitude2,
  ) {
    toRadians(double degree) => degree * pi / 180;
    const double r = 6378137.0; // 地球の半径
    final double f1 = toRadians(latitude1);
    final double f2 = toRadians(latitude2);
    final double l1 = toRadians(longitude1);
    final double l2 = toRadians(longitude2);
    final num a = pow(sin((f2 - f1) / 2), 2);
    final double b = cos(f1) * cos(f2) * pow(sin((l2 - l1) / 2), 2);
    final double d = 2 * r * asin(sqrt(a + b));
    return d;
  }

  // 現在位置の取得方法
  _getCurrentLocation() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {

      // 位置を変数に格納する
      _currentPosition = position;

      print('CURRENT POS: $_currentPosition');

      // await _getAddress();
    }).catchError((e) {
      print(e);
    });
  }

  // イベント完了処理
  void completeEvent(UserModel user, EventModel event) {
    isEventCompleted = true;
  }

  // イベントの完了状態を確認
  bool get eventStatus => isEventCompleted;

  get onUserSelected => null;
}
