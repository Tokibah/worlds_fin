import 'package:flutter/material.dart';
import 'package:world_s/pages/TicketListPage/ticket_list_con.dart';

class TicketListPage extends StatelessWidget {
  const TicketListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => ContTicketList());
      },
    ));
  }
}
