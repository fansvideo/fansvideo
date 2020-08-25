import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoDemo extends StatefulWidget {
  final String videoUrl;

  const VideoDemo({Key key, @required this.videoUrl}) : super(key: key);

  @override
  _VideoDemoState createState() => _VideoDemoState();
}

class _VideoDemoState extends State<VideoDemo> {
  VideoPlayerController _videoPlayerController;

  bool isPlaying = true;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(widget.videoUrl)
      ..addListener(() {
        setState(() {});
      })
      ..initialize()
      ..setLooping(true)
      ..play().then((value) {
        setState(() {});
      });

//    WidgetsBinding.instance.addPostFrameCallback((_) {
//      // mutes the video
//      _videoPlayerController.setVolume(0);
//      // Plays the video once the widget is build and loaded.
//      _videoPlayerController.play();
//    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: _videoPlayerController.value.initialized
          ? VideoPlayer(_videoPlayerController)
          : Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.pinkAccent),
              ),
            ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }
}
