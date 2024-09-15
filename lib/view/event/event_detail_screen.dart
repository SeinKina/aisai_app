import 'package:flutter/material.dart';

import '../../model/eventmodel/event_model.dart';
import 'viewmodel/event_detail_viewmodel.dart';

class EventDetailScreen extends StatelessWidget {
  final EventModel event;

  EventDetailScreen({required this.event, required String image, required String place, required String date});

  @override
  Widget build(BuildContext context) {
    final viewModel = EventDetailViewModel(event: event);

    return Scaffold(
      appBar: AppBar(title: const Text('イベント詳細')),
      body: Column(
        children: [
          Image.asset(event.image),
          Text(
            '開催場所: ${event.place}',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            '開催日: ${event.date}',
            style: const TextStyle(fontSize: 20),
          ),
          ElevatedButton(
            onPressed: viewModel.onUserSelected,
            child: const Text('イベントへGO'),
          ),
        ],
      ),
    );
  }
}
