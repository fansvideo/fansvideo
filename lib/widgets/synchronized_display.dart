import 'dart:math';

import 'package:fansvideo/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class SynchronizedDisplay extends StatefulWidget {
  const SynchronizedDisplay({Key key, this.hash, this.uri, this.title})
      : super(key: key);
  final String hash;
  final String uri;
  final String title;

  @override
  _SynchronizedDisplayState createState() => _SynchronizedDisplayState();
}

class _SynchronizedDisplayState extends State<SynchronizedDisplay>
    with SingleTickerProviderStateMixin {
  Animation<double> animatedWidth;
  AnimationController controller;

  double end = 100;

  @override
  Widget build(BuildContext context) {
    final w = animatedWidth.value;

    return Stack(
      alignment: Alignment(1.225, 0.0),
      children: [
        Transform.translate(
          offset: Offset(w, 0),
          child: Container(
            width: 200,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF888888), Color(0xFFAAAAAA)],
                  stops: [.1, 1],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius:
                BorderRadius.only(topRight: radius, bottomRight: radius)),
          ),
        ),
        BlurHash(
          onStarted: onStarted,
          hash: widget.hash,
          image: widget.uri,
          duration: duration,
        ),
        Align(
          alignment: Alignment(1.4, 0),
          child: Icon(
            Icons.chevron_right,
            size: 60,
            color: Colors.white,
          ),
        ),
        Transform.rotate(
          angle: pi * -.5,
          child: Text(
            widget.title,
            style: TextStyle(
                    color: const Color(0xFFDDDDDD),
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none),
          ),
        )
      ],
    );
  }

  void onStarted() {
    controller.forward();
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: duration, vsync: this);
    final curved =
    CurvedAnimation(parent: controller, curve: Curves.easeOutCirc);
    animatedWidth = Tween<double>(begin: -50, end: end).animate(curved);
    controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}