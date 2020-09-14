import 'package:flutter/material.dart';
import 'package:video_test/pages/black_screen_page.dart';

class UserRowWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlackScreenPage('User info'),
                ),
              );
            },
            child: Row(children: [
              Container(
                padding: EdgeInsets.only(right: 5),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/cat.jpg"),
                ),
              ),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Wendy<OMarley',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  '1 day ago',
                  style: TextStyle(color: Colors.white),
                )
              ])
            ]),
          ),
        ),
        SizedBox(
          width: 50,
        ),
        Container(
          height: 50,
          child: Image.asset('assets/images/userActions.png'),
        ),
      ],
    );
  }
}
