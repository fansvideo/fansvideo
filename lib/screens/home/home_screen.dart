import 'package:fansvideo/blocs/bloc_auth/bloc.dart';
import 'package:fansvideo/blocs/cubits/cubits.dart';
import 'package:fansvideo/blocs/cubits/home_sections/home_sections_cubit.dart';
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
    {"title": "top_section", "section": TopSection()}
  ];

  var homeSections = [
    TopSection(),
    HashSection(title: 'hash01', color: Colors.blue),
    HashSection(title: 'hash02', color: Colors.green),
    HashSection(title: 'hash03', color: Colors.pink),
    HashSection(title: 'hash04', color: Colors.green),
    HashSection(title: 'hash05', color: Colors.black87),
    HashSection(title: 'hash06', color: Colors.blue),
    HashSection(title: 'hash07', color: Colors.blue),
    HashSection(title: 'hash08', color: Colors.green),
    HashSection(title: 'hash09', color: Colors.pink),
    HashSection(title: 'hash10', color: Colors.green),
    HashSection(title: 'hash11', color: Colors.black87),
    HashSection(title: 'hash12', color: Colors.blue),
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
        child: BlocProvider(
          create: (_) => HomeSections(),
          child: Stack(children: [
            FractionallySizedBox(
              heightFactor: topMark,
              child: TopBanner(
                bannerUrl: 'assets/images/banner/banner01.jpg',
                bannerHash: r'LEIX56zm8_~Xx@x[?aoHsj-:tSE2',
              ),
            ),
//            BackdropFilter(child: , filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15)),
            InViewNotifierList(
              itemCount: homeSections.length,
              builder: (context, index) => InViewNotifierWidget(
                builder: (BuildContext context, bool isInView, Widget child) {
                  if (isInView) {
                    BlocProvider.of<HomeSections>(context)
                        .setSection('hash${index.toString().padLeft(2, '0')}');
                  }
                  return homeSections[index];
                },
                id: index.toString(),
              ),
              isInViewPortCondition: (double deltaTop, double deltaBottom,
                  double viewPortDimension) {
                return deltaTop < (topMark/2 * viewPortDimension);
              },
            ),

//            buildInViewNotifierList()
          ]),
        ),
      ),
    );
  }
}
