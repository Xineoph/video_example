import 'package:flutter/material.dart';
import 'package:video_test/pages/black_screen_page.dart';

class VideoPreviewWidget extends StatefulWidget {
  @override
  _VideoPreviewWidgetState createState() => _VideoPreviewWidgetState();
}

class _VideoPreviewWidgetState extends State<VideoPreviewWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlackScreenPage('Add Answer'),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.only(left: 10),
        height: 100,
        child: Image.asset('assets/images/addAnswer.png'),
      ),
    );
  }
}
