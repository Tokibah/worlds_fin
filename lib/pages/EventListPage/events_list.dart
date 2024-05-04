import 'package:flutter/material.dart';
import 'package:world_s/pages/EventListPage/widget_e/filter_Event.dart';

class EventsListPage extends StatelessWidget {
  const EventsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          Text(
            "Events List",
            style: TextStyle(fontSize: 35),
          ),
          SizedBox(height: 20),
          FilterButton(),
        ],
      ),
    );
  }
}
