import 'package:flutter/material.dart';
import 'package:video_test/pages/black_screen_page.dart';
import 'package:video_player/video_player.dart';
import 'package:video_test/widgets/user_row_widget.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:video_test/widgets/video_prewiew_widgets.dart';
import 'package:video_test/widgets/video_widgets.dart';

class VideoPage extends StatefulWidget {
  final Function func;
  VideoPage({this.func, Key key}) : super(key: key);
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  Future<void> _initializeVideoPlayerFuture;
  VideoPlayerController _controller;
  List<String> videoLink = [
    'assets/video/unicorns.mp4',
    'assets/video/cake.mp4'
  ];
  int videoIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  void changeVideoSwipe(int newIndex) {
    setState(() {
      _controller.pause();
      videoIndex = newIndex;
      _controller = VideoPlayerController.asset(videoLink[newIndex]);
      _initializeVideoPlayerFuture = _controller.initialize();
      _controller.play();
    });
  }

  VideoPlayerController videoController(String link) {
    if (_controller == null) {
      _controller = VideoPlayerController.asset(link);
      _initializeVideoPlayerFuture = _controller.initialize();
      _controller.play();
      _controller.setLooping(true);
    }
    return _controller;
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidthData = MediaQuery.of(context).size.width;
    videoController(videoLink[videoIndex]);
    return Stack(
      children: [
        Swiper(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    int newIndex = videoIndex == 0 ? 1 : 0;
                    Function swipe = () => changeVideoSwipe(newIndex);

                    return SwipeDetector(
                      onSwipeLeft: swipe,
                      onSwipeRight: swipe,
                      child: Container(
                        child: VideoPlayer(videoController(videoLink[index])),
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            );
          },
          itemCount: videoLink.length,
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
              UserRowWidget(),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                    height: 110,
                    child: VideoPreviewWidget(),
                  ),
                  Container(
                      width: deviceWidthData - 100,
                      child: Row(
                        children: [
                          VideoButton(func1:() => changeVideoSwipe(0),
                          func2:() => changeVideoSwipe(1)),
                        ],
                      ))
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
  
}
