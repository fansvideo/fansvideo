import 'package:fansvideo/widgets/blurhash_image.dart';
import 'package:flutter/material.dart';

class MyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: FansBlurHashImage(
              hash: "LKO2?U%2Tw=w]~RBVZRi};RPxuwH",
            ),
          ),
          Center(
            child: Text(
              '我的',
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
          )
        ],
      ),
    );
  }
}
