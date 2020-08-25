import 'package:fansvideo/models/video.dart';
import 'package:fansvideo/repository/fake_repository.dart';
import 'package:fansvideo/screens/home/widgets/home_widgets.dart';
import 'package:fansvideo/screens/video_demo/video_demo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopularScreen extends StatefulWidget {
  @override
  _PopularScreenState createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen>
    with SingleTickerProviderStateMixin {
  double _selectTab;
  int currentPage;
  bool _isPlaying = true;

  @override
  void initState() {
    super.initState();
    _selectTab = 1;
    currentPage = 0;

  }

  @override
  void dispose() {
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
//          return VideoDemo(videoUrl: 'assets/videos/Video${index + 1}.mp4');
          Video _video = FakeRepository.videos[index];
          return Stack(
            children: [
              Container(
                  width: double.infinity,
                  height: size.height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/2.jpg'),
                        fit: BoxFit.cover),
                  ),
                  child: VideoDemo(videoUrl: 'assets/videos/Video${index + 1}.mp4')
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
