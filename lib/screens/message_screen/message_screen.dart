import 'package:fansvideo/widgets/blurhash_image.dart';
import 'package:flutter/material.dart';


class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: FansBlurHashImage(
              hash: "L6Pj0^i_.AyE_3t7t7R**0o#DgR4",
            ),
          ),
          Center(
            child: Text(
              'Message',
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
          )
        ],
      ),
    );
  }
}
