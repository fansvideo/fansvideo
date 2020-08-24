
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageWithText extends StatelessWidget {
  final ImageProvider image;
  final String text;
  final Color color;
  const ImageWithText({
    Key key,
    @required this.image,
    @required this.text,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageIcon(image,
        color: color,
        size: 40,),
        SizedBox(height: 4,),
        Text(text),
      ],
    );
  }
}