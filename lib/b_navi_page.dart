import 'package:flutter/material.dart';
import 'package:world_s/pages/EventListPage/events_list.dart';
import 'package:world_s/pages/RecordsPage/records.dart';
import 'package:world_s/pages/TicketListPage/ticket_list.dart';

class NavigatePage extends StatefulWidget {
  const NavigatePage({
    super.key,
  });

  @override
  State<NavigatePage> createState() => _NavigatePageState();
}

class _NavigatePageState extends State<NavigatePage> {
  int selecIndex = 0;

  List<Widget> _page = [EventsListPage(), TicketListPage(), RecordsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selecIndex,
        children: _page,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(border: Border(top: BorderSide(width: 1))),
        height: 85,
        child: BottomNavigationBar(
          currentIndex: selecIndex,
          onTap: (index) {
            setState(() {
              selecIndex = index;
            });
          },
          unselectedFontSize: 23,
          selectedFontSize: 24,
          unselectedLabelStyle: TextStyle(color: Colors.black),
          iconSize: 0,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: "Events"),
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: "Tickets"),
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: "Records"),
          ],
          selectedItemColor: Colors.red,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
