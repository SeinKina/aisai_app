import 'package:aisai_app/model/eventmodel/event_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventListViewmodel {
  FirebaseFirestore db = FirebaseFirestore.instance;

  late final CollectionReference docRef;
  late List<EventModel> events;

  EventListViewmodel() {
    docRef = db.collection('events');
  }

  // イベント一覧を取得する
  Future<void> getEvents() async {
    final querySnapshot = await docRef.get();
    
    events = querySnapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return EventModel(
        eid: data['eid'],
        position: data['position'],
        imagePath: data['imagePath'],
        place: data['place'],
        date: data['date'],
      );
    }).toList();
  }
}
