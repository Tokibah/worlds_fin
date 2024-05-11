import 'package:flutter/material.dart';
import 'package:world_s/pages/EventListPage/event_page_cont.dart';

class EventsListPage extends StatelessWidget {
  const EventsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => ContentEventPage());
      },
    ));
  }
}
