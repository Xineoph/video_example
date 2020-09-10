import 'package:flutter/material.dart';
import 'package:video_test/pages/black_screen_page.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  final Function func;
  VideoPage({this.func, Key key}) : super(key: key);
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  Future<void> _initializeVideoPlayerFuture;
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  VideoPlayerController videoController(String link) {
    if (_controller == null) {
      _controller = VideoPlayerController.asset(link);
      _initializeVideoPlayerFuture = _controller.initialize();
      _controller.play();
    }
    return _controller;
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidthData = MediaQuery.of(context).size.width;
    videoController('assets/video/cake.mp4');
    return Stack(
      children: [
        Container(
          child: FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Container(
                  child: VideoPlayer(videoController('assets/video/cake.mp4')),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
        Positioned(
          top: 20,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: widget.func,
                child: Container(
                  height: 50,
                  child: Image.asset('assets/images/closeBackgroundWhite.png'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlackScreenPage("Question Info"),
                    ),
                  );
                },
                child: Container(
                  width: deviceWidthData - 100,
                  child: Text(
                    'What are your 5 most liked songs',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.orange,
                        fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _userInfoRow(),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 110,
                child: _answersRow(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _userInfoRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  style: TextStyle(fontFamily: 'TT Hoves', color: Colors.white),
                ),
                Text(
                  '1 day ago',
                  style: TextStyle(fontFamily: 'TT Hoves', color: Colors.white),
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

  Widget _answersRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlackScreenPage('Add Answer'),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.only(left: 10),
            height: 100,
            child: Image.asset('assets/images/addAnswer.png'),
          ),
        ),
        _gorizontalVideo(context),
      ],
    );
  }

  Widget _gorizontalVideo(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 10.0),
        height: 100.0,
        child: Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                _videoPreview('assets/video/unicorn.mp4'),
                _videoPreview('assets/video/lake.mp4'),
                _videoPreview('assets/video/cake.mp4')
              ],
            ),
          ),
        ));
  }

  Widget _videoPreview(String path) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.symmetric(horizontal: 3),
          height: 100.0,
          width: 70.0,
          child: VideoPlayer(videoController(path))),
    );
  }
}
