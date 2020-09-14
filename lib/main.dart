import 'package:flutter/material.dart';
import 'package:video_test/pages/home_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'TT-Hoves'),
      home: MyHomePage(),
    );
  }
}


