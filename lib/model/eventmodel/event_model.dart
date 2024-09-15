import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  final String eid;
  final GeoPoint position;
  final String imagePath;
  final String place;
  final String date;

  EventModel({
    required this.eid,
    required this.position,
    required this.imagePath,
    required this.place,
    required this.date,
  });
}
