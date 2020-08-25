import 'package:fansvideo/models/video.dart';
import 'package:fansvideo/repository/fake_repository.dart';
import 'package:fansvideo/screens/home/widgets/home_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  double _selectTab;
  VideoPlayerController _videoPlayerController;
  bool _isPlaying = true;

  @override
  void initState() {
    super.initState();
    _selectTab = 1;
    _videoPlayerController =
        VideoPlayerController.asset('assets/videos/Video2.mp4')
          ..initialize()
          ..setLooping(true)
          ..play().then((value) {
            setState(() {});
          });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView.builder(
        controller: PageController(
          initialPage: 0,
        ),
        scrollDirection: Axis.vertical,
        itemCount: FakeRepository.videos.length,
        itemBuilder: (context, index) {
          Video _video = FakeRepository.videos[index];
          return Stack(
            key: ValueKey<String>(_video.id),
            children: [
              Container(
                width: double.infinity,
                height: size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/2.jpg'),
                      fit: BoxFit.cover),
                ),
                child: _videoPlayerController.value.initialized
                    ? Container(
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                if (_videoPlayerController.value.isPlaying) {
                                  _isPlaying = false;
                                  _videoPlayerController.pause();
                                } else {
                                  _isPlaying = true;
                                  _videoPlayerController.play();
                                }
                              });
                            },
                            child: VideoPlayer(_videoPlayerController)),
                      )
                    : Container(),
              ),
              Positioned(
                child: buildTab(),
              ),
              RightMenu(),
              VideoDescription(),
            ],
          );
        },
      ),
    );
  }

  Padding buildTab() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => setTab(0),
            child: Text(
              '关注',
              style: TextStyle(
                color: (_selectTab == 0)
                    ? Colors.white.withOpacity(.8)
                    : Colors.white.withOpacity(.6),
                fontSize: 24,
                fontWeight: (_selectTab == 0) ? FontWeight.bold : null,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: () => setTab(1),
            child: Text(
              '热门',
              style: TextStyle(
                  color: (_selectTab == 1)
                      ? Colors.white.withOpacity(.8)
                      : Colors.white.withOpacity(.6),
                  fontSize: 24,
                  fontWeight: (_selectTab == 1) ? FontWeight.bold : null),
            ),
          ),
        ],
      ),
    );
  }

  setTab(double i) {
    setState(() => _selectTab = i);
  }
}

class _ButterFlyAssetVideo extends StatefulWidget {
  @override
  _ButterFlyAssetVideoState createState() => _ButterFlyAssetVideoState();
}

class _ButterFlyAssetVideoState extends State<_ButterFlyAssetVideo> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/Video1.mp4');

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 20.0),
          ),
          const Text('With assets mp4'),
          Container(
            padding: const EdgeInsets.all(20),
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  VideoPlayer(_controller),
//                  _PlayPauseOverlay(controller: _controller),
                  VideoProgressIndicator(_controller, allowScrubbing: true),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
