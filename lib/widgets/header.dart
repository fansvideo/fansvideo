import 'package:fansvideo/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  Header({
    Key key,
    this.progression,
  }) : super(key: key);

  final gradient = ColorTween(begin: Colors.white, end: Colors.pink);

  final double progression;

  @override
  Widget build(BuildContext context) {
    final base = progression / 350;
    final color = gradient.lerp(base);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "成为Flutter软件工程师",
          style: TextStyle(
              color: color,
              fontSize: 57,
//              height: 1,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none),
        ),
        Container(
          margin: EdgeInsets.only(top: 16),
          child: Text(
            "借助我们灵活的节奏选择，您可以在短短15周内\n或以自己的速度在线在虚拟校园中学习编码。",
            style: TextStyle(
                color: color,
                fontSize: 24,
                height: 1.5,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        FansCustomButton(
          icon: CupertinoIcons.book,
          text: '加入学习',
          onPress: () {
            print('test');
          },
        ),
      ],
    );
  }
}
