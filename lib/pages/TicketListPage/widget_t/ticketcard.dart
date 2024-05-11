import 'package:flutter/material.dart';
import 'package:world_s/pages/TicketListPage/model/Ticket.dart';
import 'package:world_s/pages/TicketListPage/ticket_detail.dart';

class TicketCard extends StatefulWidget {
  TicketCard({super.key, required this.tickcard, required this.onDiss});

  List<Ticket> tickcard;
  final Function(dynamic) onDiss;

  @override
  State<TicketCard> createState() => _TicketCardState();
}

class _TicketCardState extends State<TicketCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.tickcard.map((tick) {
        return Dismissible(
          key: UniqueKey(),
          onDismissed: (direction) {
            widget.onDiss(tick);
          },
          background: Container(
            decoration: BoxDecoration(color: Colors.red),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.recycling,
                        size: 50,
                      ),
                      Text(
                        "Remove",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TicketDetail(ticketd: tick),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 120,
                width: 260,
                decoration: BoxDecoration(color: Colors.grey[400]),
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Text(
                        tick.name,
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Text(
                        tick.seat,
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
