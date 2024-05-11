import 'package:flutter/material.dart';
import 'package:world_s/pages/EventListPage/widget_e/filter_Event.dart';

class ContentEventPage extends StatefulWidget {
  const ContentEventPage({super.key});

  @override
  State<ContentEventPage> createState() => _ContentEventPageState();
}

class _ContentEventPageState extends State<ContentEventPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 50),
        Text(
          "EVENTS LIST",
          style: TextStyle(fontSize: 35),
        ),
        SizedBox(height: 20),
        FilterButton(),
      ],
    );
  }
}
