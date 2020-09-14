import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoButton extends StatefulWidget {
  final Function func1;
  final Function func2;

  VideoButton({this.func1, this.func2});
  @override
  _VideoButtonState createState() => _VideoButtonState();
}

class _VideoButtonState extends State<VideoButton> {
  VideoPlayerController _controller1;
  VideoPlayerController _controller2;

  VideoPlayerController videoController1() {
    if (_controller1 == null) {
      _controller1 = VideoPlayerController.asset('assets/video/unicorns.mp4');
      _controller1.initialize();
    }
    return _controller1;
  }

  VideoPlayerController videoController2() {
    if (_controller2 == null) {
      _controller2 = VideoPlayerController.asset('assets/video/cake.mp4');
      _controller2.initialize();
    }
    return _controller2;
  }

  @override
  Widget build(BuildContext context) {
    videoController1();
    videoController2();

    return Row(
      children: [
        _video(_controller1, widget.func1),
        _video(_controller2, widget.func2)
      ],
    );
  }

  Widget _video(controller, Function func) {
    return GestureDetector(
      onTap: func,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 3),
        height: 100.0,
        width: 70.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: VideoPlayer(controller),
        ),
      ),
    );
  }
}
