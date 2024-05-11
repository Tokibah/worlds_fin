import 'dart:math';

import 'package:flutter/material.dart';
import 'package:world_s/pages/TicketListPage/model/Ticket.dart';

class TicketCreatePage extends StatefulWidget {
  const TicketCreatePage({super.key});

  @override
  State<TicketCreatePage> createState() => _TicketCreatePageState();
}

class _TicketCreatePageState extends State<TicketCreatePage> {
  String inname = "";
  String? _intype;
  bool intypecol = false;

  final key = GlobalKey<FormState>();

  String fetchtime() {
    DateTime x = DateTime.now();
    String time = "${x.year}-${x.month}-${x.day} ${x.hour}:${x.minute}";
    return time;
  }

  String fetchseat() {
    final random = Random();
    final charac = ['A', 'B', 'C'];

    final ranchar = charac[random.nextInt(charac.length)];
    final ranno = random.nextInt(9) + 1;
    final ranro = random.nextInt(9) + 1;
    final ranco = random.nextInt(9) + 1;

    String seat = "$ranchar$ranno Row$ranro Column$ranco";
    return seat;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Ticket Create",
                  style: TextStyle(fontSize: 35),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: 330,
                  height: 45,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: intypecol == true ? Colors.red : Colors.black,
                          width: 1)),
                  child: DropdownButton(
                    hint: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Choose ticket type"),
                    ),
                    value: _intype,
                    items: [
                      DropdownMenuItem(
                          value: "Opening",
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Opening Ceremony Tickets"),
                          )),
                      DropdownMenuItem(
                          value: "Closing",
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Closing Ceremony Tickets"),
                          ))
                    ],
                    onChanged: (String? newtype) {
                      if (newtype != null) {
                        setState(() {
                          _intype = newtype;
                        });
                      }
                    },
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    isExpanded: true,
                    underline: Container(),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Form(
                  key: key,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "name must be filled";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (newValue) {
                        inname = newValue ?? "";
                      },
                      decoration: InputDecoration(
                          hintText: "Enter your name",
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(20)),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          errorStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    if (this.key.currentState!.validate()) {
                      this.key.currentState!.save();
                      final date = fetchtime();
                      final seat = fetchseat();

                      Ticket newticket = Ticket(
                          type: _intype ?? "",
                          name: inname,
                          date: date,
                          seat: seat);
                      Navigator.pop(context, newticket);
                    }
                    if (_intype == null || _intype == "") {
                      setState(() {
                        intypecol = true;
                      });
                    } else {
                      setState(() {
                        intypecol = false;
                      });
                    }
                  },
                  child: Container(
                    width: 290,
                    height: 38,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 220, 213, 151),
                        border: Border.all(color: Colors.black, width: 1)),
                    child: Center(
                        child: Text(
                      "Create",
                      style: TextStyle(fontSize: 23),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
