import 'package:fansvideo/blocs/cubits/cubits.dart';
import 'package:fansvideo/widgets/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class HashSection extends StatelessWidget {
  final String title;
  final Color color;

  const HashSection({Key key, this.title, this.color = Colors.blueGrey})
      : assert(title != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String releaseUrl = kIsWeb ? "assets/assets/images/banner/banner02.jpg" : 'assets/images/banner/banner02.jpg';
    return Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            child: Center(
              child: BlurHash(hash: r'LEIX56zm8_~Xx@x[?aoHsj-:tSE2'),
            ),
          ),
          Container(
            height: size.height,
            width: size.width,
            child: Center(
              child: BlocBuilder<HomeSections, String>(
                builder: (BuildContext context, state) {
                  return state == title ? SynchronizedDisplay(
                    hash: r'LEIX56zm8_~Xx@x[?aoHsj-:tSE2',
                    uri: releaseUrl,
                  ) : Container();
                },
              ),
            ),
          ),
          Container(
            height: size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black87, Colors.black45, Colors.transparent],
                stops: [0, .1, 1],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
        ]
    );
  }
}
