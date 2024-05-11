import 'package:flutter/material.dart';
import 'package:world_s/pages/TicketListPage/model/Ticket.dart';

class TicketDetail extends StatefulWidget {
  TicketDetail({super.key, required this.ticketd});

  Ticket ticketd;

  @override
  State<TicketDetail> createState() => _TicketDetailState();
}

class _TicketDetailState extends State<TicketDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Column(
              children: [
                Text(
                  "Ticket Detail",
                  style: TextStyle(fontSize: 35),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                width: 300,
                decoration: BoxDecoration(color: Colors.grey[300]),
                child: Center(
                  child: Text(
                    "Ticket type: ${widget.ticketd.type}\nAudience's name: ${widget.ticketd.name}\nTime: ${widget.ticketd.date}\nSeat: ${widget.ticketd.seat}",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
