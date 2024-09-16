import 'dart:math';

import 'package:geolocator/geolocator.dart';

import '../../../model/eventmodel/event_model.dart';

class EventDetailViewModel {
  final EventModel event;
  bool isEventCompleted = false;

  EventDetailViewModel({required this.event});

  // 現在位置の記憶用
  late Position _currentPosition;

  // 距離計算ロジック
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

  // 現在位置の取得
  Future<void> getCurrentLocation() async {
    _currentPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  // イベント完了処理
  Future<double> completeEvent() async {
    isEventCompleted = true;
    await getCurrentLocation();
    double distance = distanceBetween(
      _currentPosition.latitude,
      _currentPosition.longitude,
      event.position.latitude,
      event.position.longitude,
    );
    return distance;
  }

  // イベントの完了状態を確認
  bool get eventStatus => isEventCompleted;
}
