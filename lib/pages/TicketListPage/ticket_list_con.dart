import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:world_s/pages/TicketListPage/model/Ticket.dart';
import 'package:world_s/pages/TicketListPage/ticket_create.dart';
import 'package:world_s/pages/TicketListPage/widget_t/ticketcard.dart';

class ContTicketList extends StatefulWidget {
  const ContTicketList({super.key});

  @override
  State<ContTicketList> createState() => _ContTicketListState();
}

class _ContTicketListState extends State<ContTicketList> {
  double downw = 300;

  List<Ticket> ticket = [
    Ticket(type: "Opening", name: "Jack", date: "2022", seat: "A9 row"),
    Ticket(type: "Closing", name: "Koli", date: "2022-4-4", seat: "A4 rowcOL"),
  ];

  List<Ticket> Openfil(String type) {
    return ticket.where((ticket) => ticket.type == type).toList();
  }

  Future<void> loadtick() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final ltick = pref.getStringList('ticket');

    if (ltick != null) {
      setState(() {
        final loaded =
            ltick.map((e) => Ticket.fromJson(jsonDecode(e))).toList();
        ticket = loaded;
      });
    }
  }

  Future<void> savetick() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    final tstring = ticket.map((e) => jsonEncode(e.toJson)).toList();
    await pref.setStringList('ticket', tstring);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadtick();
  }

  void Dissmis(tha) {
    setState(() {
      ticket.remove(tha);
      savetick();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              "TICKET LIST",
              style: TextStyle(fontSize: 35),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTapDown: (details) {
                setState(() {
                  downw = 280;
                });
              },
              onTapCancel: () {
                setState(() {
                  downw = 300;
                });
              },
              child: SizedBox(
                width: downw,
                height: 50,
                child: ElevatedButton(
                    onPressed: () async {
                      Ticket newtick = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TicketCreatePage()));

                      setState(() {
                        ticket.add(newtick);
                        savetick();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 220, 213, 151),
                        shape: RoundedRectangleBorder(),
                        side: BorderSide(color: Colors.black, width: 1)),
                    child: Text(
                      "Create new ticket",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    )),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Text(
              "Opening Ceremony Tickets",
              style: TextStyle(fontSize: 22),
            ),
            TicketCard(tickcard: Openfil("Opening"), onDiss: Dissmis),
            SizedBox(
              height: 20,
            ),
            Text(
              "Closing Ceremony Tickets",
              style: TextStyle(fontSize: 22),
            ),
            TicketCard(tickcard: Openfil("Closing"), onDiss: Dissmis),
          ],
        ),
      ),
    ));
  }
}
