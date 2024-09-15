import 'package:geolocator/geolocator.dart';

class EventModel {
  final String imagePath;
  final String place;
  final String date;
  final String eid;
  final Position position;

  EventModel({required this.eid, required this.position, required this.imagePath, required this.place, required this.date});
}