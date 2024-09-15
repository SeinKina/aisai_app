import 'package:aisai_app/model/eventmodel/event_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventListViewmodel {
  FirebaseFirestore db = FirebaseFirestore.instance;

  late final CollectionReference docRef;
  List<EventModel> events = List.empty(growable: true);

  EventListViewmodel() {
    // Firestore内の 'events' コレクションを参照
    docRef = db.collection('events');
  }

  // イベント一覧を取得する
  Future<void> getEvents() async {
    try {
      final querySnapshot = await docRef.get();

      // Firestoreから取得したドキュメントをイベントモデルに変換
      events = querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        GeoPoint geoPoint = data['position']; // FirestoreのGeoPoint型
        print('Fetching event: ${data['eid']} at position: ${geoPoint.latitude}, ${geoPoint.longitude}');
        
        return EventModel(
          eid: data['eid'],
          position: GeoPoint(geoPoint.latitude, geoPoint.longitude),
          imagePath: data['imagePath'],
          place: data['place'],
          date: data['date'],
        );
      }).toList();
      
      print('Fetched ${events.length} events'); // イベントの数をデバッグ出力

    } catch (e) {
      print('Error getting events: $e'); // エラーをコンソールに出力
    }
  }
}
