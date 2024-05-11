import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:world_s/pages/EventListPage/model_e/event.dart';
import 'package:flutter/material.dart';

class EventDetailPage extends StatefulWidget {
  const EventDetailPage({super.key, required this.eventd});

  final Event eventd;

  @override
  State<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  Future<void> savedcount(int count) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    await pref.setInt(widget.eventd.title, count);
  }

  void increment() {
    setState(() {
      widget.eventd.view++;
    });
    savedcount(widget.eventd.view);
  }

  Future<void> fetchcount() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    final int? tem = pref.getInt(widget.eventd.title);
    if (tem != null) {
      setState(() {
        widget.eventd.view = tem;
      });
    }
  }

  void get() async {
    await fetchcount();
    increment();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }

  void _showBiggerImage(int initialIndex) {
    List<String> imagePaths = [
      widget.eventd.image1 ?? "assets/pic/unva.jpeg",
      widget.eventd.image ?? "assets/pic/unva.jpeg",
      widget.eventd.image2 ?? "assets/pic/unva.jpeg",
    ];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 400,
            child: PageView.builder(
              itemCount: imagePaths.length,
              controller: PageController(initialPage: initialIndex),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Image.asset(
                    imagePaths[index],
                    fit: BoxFit.fill,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Stack(children: [
            Column(
              children: [
                Text(
                  "EVENT DETAILS",
                  style: TextStyle(fontSize: 35),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(color: Colors.grey[400]),
                  child: Center(
                      child: Text(
                    widget.eventd.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
                ),
                Text(
                  "view counts",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  widget.eventd.view.toString(),
                  style: TextStyle(fontSize: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _showBiggerImage(0);
                      },
                      child: Container(
                        height: 120,
                        width: 110,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            border: Border.all(color: Colors.grey, width: 3)),
                        child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.asset(widget.eventd.image1 ??
                                "assets/pic/unva.jpeg")),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _showBiggerImage(1);
                      },
                      child: Hero(
                        tag: 'midpic',
                        child: Container(
                          height: 120,
                          width: 110,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              border: Border.all(color: Colors.grey, width: 3)),
                          child: FittedBox(
                              fit: BoxFit.fill,
                              child: Image.asset(widget.eventd.image ??
                                  "assets/pic/unva.jpeg")),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _showBiggerImage(2);
                      },
                      child: Container(
                        height: 120,
                        width: 110,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            border: Border.all(color: Colors.grey, width: 3)),
                        child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.asset(widget.eventd.image2 ??
                                "assets/pic/unva.jpeg")),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.grey[300]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.eventd.info,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
