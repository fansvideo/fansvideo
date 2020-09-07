import 'package:fansvideo/blocs/bloc_auth/bloc.dart';
import 'package:fansvideo/blocs/cubits/cubits.dart';
import 'package:fansvideo/screens/home/sections/sections.dart';
import 'package:fansvideo/screens/home/widgets/top_banner.dart';
import 'package:fansvideo/utils/constants.dart';
import 'package:fansvideo/widgets/blurhash_image.dart';
import 'package:fansvideo/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double progression = 0;

  void onStarted() => print('Ready.');

  var _homeSections = [
    {
      "title": "top_section",
      "section": TopSection()
    }
  ];

  var homeSections = [
    TopSection(),
    Container(
      height: 1000,
      color: Colors.blue.withAlpha(90),
    ),
    Container(
      height: 1000,
      color: Colors.green.withAlpha(90),
    ),
    Container(
      height: 1000,
      color: Colors.pink.withAlpha(90),
    ),
    Container(
      height: 1000,
      color: Colors.green.withAlpha(90),
    ),
    Container(
      height: 1000,
      color: Colors.black87.withAlpha(90),
    ),
    Container(
      height: 1000,
      color: Colors.blue.withAlpha(90),
    ),
  ];

  double norm(double value, double min, double max) =>
      (value - min) / (max - min);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(size.width, 60),
        child: BlocBuilder<AppBarCubit, double>(
          builder: (context, scrollOffset) {
            return FansAppBar();
          },
        ),
      ),
      body: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            // NO need to setState
            BlocProvider.of<AppBarCubit>(context)
                .setOffset(notification.metrics.pixels);
            setState(() {
              progression = norm(notification.metrics.pixels, 0, 1);
            });
            return true;
          },
          child: Stack(children: [
            FractionallySizedBox(
              heightFactor: topMark,
              child: TopBanner(
                bannerUrl: 'images/banner/banner01.jpg',
                bannerHash: r'LEIX56zm8_~Xx@x[?aoHsj-:tSE2',
              ),
            ),
//            BackdropFilter(child: , filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15)),
            InViewNotifierList(
              itemCount: homeSections.length,
              builder: (context, index) => InViewNotifierWidget(
                builder: (BuildContext context, bool isInView, Widget child) {
                  return homeSections[index];
                },
                id: index.toString(),
              ),
              isInViewPortCondition: (double deltaTop, double deltaBottom,
                  double viewPortDimension) {
                return deltaTop < (topMark * viewPortDimension);
              },
            ),

//            buildInViewNotifierList()
          ])),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget buildInViewNotifierList() => InViewNotifierList(
      itemCount: entries.length + 2,
      builder: (ctx, idx) => InViewNotifierWidget(
          id: '$idx',
          builder: (BuildContext context, bool isInView, Widget child) {
            if (idx == 0) return SizedBox(height: 500);
            if (idx == entries.length + 1) return SizedBox(height: 800);

            return buildEntry(isInView, idx - 1);
          }),
      isInViewPortCondition:
          (double deltaTop, double deltaBottom, double viewPortDimension) =>
              deltaTop < (topMark * viewPortDimension)
      //&& deltaBottom > (0.3 * viewPortDimension)
      );

  Container buildEntry(bool isInView, int idx) => Container(
      padding: EdgeInsets.only(left: 0, right: 200),
      height: 510,
      margin: const EdgeInsets.only(bottom: 24),
      child: isInView || idx == 0
          ? SynchronizedDisplay(
              hash: entries[idx][0],
              uri: entries[idx][1],
              title: entries[idx][2])
          : BlurHash(hash: entries[idx][0]));
}
