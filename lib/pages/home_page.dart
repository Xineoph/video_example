import 'package:flutter/material.dart';
import 'package:video_test/pages/video_page.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PanelController _controllerPanel = PanelController();

  @override
  Widget build(BuildContext context) {
    double heightData = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SlidingUpPanel(
        maxHeight: heightData,
        controller: _controllerPanel,
        backdropTapClosesPanel: true,
        borderRadius: BorderRadius.circular(30),
        renderPanelSheet: false,
        panel: _panelView(),
        collapsed: _collapsedView(),
        body: Container(
          color: Colors.black,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: Text(
                ("Home"),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _collapsedView() {
    return GestureDetector(
      onTap: () => _controllerPanel.open(),
      child: Container(
        margin: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(30.0),
              topRight: const Radius.circular(30.0)),
        ),
        child: Container(
          padding: EdgeInsets.only(top: 15),
          child: Text(
            ("drag to open"),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _panelView() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0.0, 60.0, 0.0, 0.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(30.0),
            topRight: const Radius.circular(30.0)),
      ),
      child: VideoPage(func: () => _controllerPanel.close()),
    );
  }
}
