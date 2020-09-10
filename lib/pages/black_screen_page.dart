import 'package:flutter/material.dart';

class BlackScreenPage extends StatelessWidget {
  final String title;
  BlackScreenPage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.black,
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'TT Hoves',
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
    ));
  }
}
