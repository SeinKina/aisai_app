import 'package:flutter/material.dart';

class MyProfileScreenViewModel {
  final String userName;
  final int userAge;
  final String userLocation;
  final String userOccupation;
  final String eventName;
  final String eventDate;
  final String eventLocation;

  MyProfileScreenViewModel({
    required this.userName,
    required this.userAge,
    required this.userLocation,
    required this.userOccupation,
    required this.eventName,
    required this.eventDate,
    required this.eventLocation,
  });
}
