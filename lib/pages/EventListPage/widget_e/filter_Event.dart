import 'package:flutter/material.dart';
import 'package:world_s/pages/EventListPage/model_e/event.dart';
import 'package:world_s/pages/EventListPage/widget_e/event_card.dart';

class FilterButton extends StatefulWidget {
  const FilterButton({super.key});

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  String filter = "All";
  List<Event> events = [
    Event(
        image: "assets/pic/download.jpeg",
        title: "New cafe!!",
        info:
            "Amazing cafe with plenty of baverages i think i will try their latte next",
        status: "Unread"),
    Event(
        image: "assets/pic/Nice_try_mom.jpeg",
        title: "Health in children",
        info:
            "Children these days.... parent need to take action in maintaining their kids health, this is important",
        status: "Read"),
    Event(title: "blank", info: "blank", status: "Unread")
  ];

  List<Event> filterEvent() {
    if (filter == "All") {
      return events;
    } else {
      return events.where((event) => event.status == filter).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          for (var option in ["All", "Unread", "Read"]) ...[
            GestureDetector(
              onTap: () => setState(() {
                filter = option;
              }),
              child: Text(
                option,
                style: TextStyle(
                    color: filter == option ? Colors.red : Colors.black,
                    fontSize: 25),
              ),
            ),
            if (option != "Read")
              Text(
                '/',
                style: TextStyle(fontSize: 25),
              ),
          ],
        ]),
        SizedBox(height: 5),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: EventCard(filtered: filterEvent()))
      ],
    );
  }
}
