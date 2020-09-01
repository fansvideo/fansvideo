import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class FansBlurHashImage extends StatefulWidget {
  final String hash;

  const FansBlurHashImage({Key key, @required this.hash}) : super(key: key);
  @override
  _FansBlurHashImageState createState() => _FansBlurHashImageState();
}

class _FansBlurHashImageState extends State<FansBlurHashImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlurHash(hash: widget.hash),
    );
  }
}
