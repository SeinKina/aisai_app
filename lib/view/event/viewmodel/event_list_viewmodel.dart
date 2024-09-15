import '../../../model/eventmodel/event_model.dart';

class EventListViewModel {
  // イベントのリスト（仮のデータ）
  final List<EventModel> events = [
    EventModel(image: 'assets/image/event.jpg', place: '東京', date: '2024-09-15'),
    EventModel(image: 'assets/image/event.jpg', place: '大阪', date: '2024-09-16'),
    EventModel(image: 'assets/image/event.jpg', place: '京都', date: '2024-09-17'),
    EventModel(image: 'assets/image/event.jpg', place: '福岡', date: '2024-09-18'),
    EventModel(image: 'assets/image/event.jpg', place: '札幌', date: '2024-09-19'),
  ];

  List<EventModel> get allEvents => events; // 全てのイベントを取得

  // イベントのフィルタリングや検索機能を追加する場合はここにロジックを追加
  List<EventModel> filterEvents(String query) {
    return events.where((event) => event.place.contains(query)).toList();
  }
}
