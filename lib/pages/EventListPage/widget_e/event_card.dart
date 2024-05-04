import 'package:flutter/material.dart';
import 'package:world_s/pages/EventListPage/model_e/event.dart';

class EventCard extends StatefulWidget {
  const EventCard({super.key, required this.filtered});

  final List<Event> filtered;

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.yellow),
        height: 450, //Conatain Size
        child: ListView.builder(
            itemCount: widget.filtered.length,
            itemBuilder: (context, index) {
              Event even = widget.filtered[index];

              return GestureDetector(
                onTap: () {
                  if (even.status == "Unread") {
                    setState(() {
                      even.status = "Read";
                    });
                  }
                  Navigator.pushNamed(context, '/eventdetailpage');
                
                },
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  child: Container(
                      decoration: BoxDecoration(color: Colors.grey[200]),
                      height: 150,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 130,
                              width: 130,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey, width: 3),
                                  color: Colors.grey,
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image:
                                          AssetImage(even.image.toString()))),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 3, right: 3, top: 8, bottom: 5),
                                child: Container(
                                  height: 30,
                                  width: 195,
                                  decoration:
                                      BoxDecoration(color: Colors.grey[400]),
                                  child: Center(
                                    child: Text(
                                      even.title,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 3, right: 3, bottom: 2),
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  height: 70,
                                  width: 195,
                                  decoration:
                                      BoxDecoration(color: Colors.grey[350]),
                                  child: Text(
                                    even.info,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                              ),
                              Text(
                                even.status,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: even.status == "Read"
                                        ? FontWeight.w400
                                        : FontWeight.w700,
                                    color: even.status == "Read"
                                        ? Colors.grey
                                        : Colors.black),
                              ),
                            ],
                          )
                        ],
                      )),
                ),
              );
            }));
  }
}
