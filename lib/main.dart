import 'package:flutter/material.dart';
import 'package:world_s/b_navi_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {},
      home: NavigatePage()
    );
  }
}
