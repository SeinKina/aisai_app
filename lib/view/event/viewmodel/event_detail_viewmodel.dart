import '../../../model/eventmodel/event_model.dart';

class EventDetailViewModel {
  final EventModel event;
  bool isEventCompleted = false;

  EventDetailViewModel({required this.event});

  // イベント完了処理
  void completeEvent() {
    isEventCompleted = true;
  }

  // イベントの完了状態を確認
  bool get eventStatus => isEventCompleted;

  get onUserSelected => null;
}
