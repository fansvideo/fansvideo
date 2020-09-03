import 'package:fansvideo/widgets/blurhash_image.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: FansBlurHashImage(
              hash: "LGF5]+Yk^6#M@-5c,1J5@[or[Q6.",
            ),
          ),
          Center(
            child: Text(
              'Add',
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
          )
        ],
      ),
    );
  }
}
