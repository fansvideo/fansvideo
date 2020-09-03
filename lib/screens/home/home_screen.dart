import 'package:fansvideo/widgets/blurhash_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: IconButton(
              tooltip: '登录',
              icon: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              onPressed: () => Navigator.of(context).pushNamed('login'),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: FansBlurHashImage(
              hash: "LEHV6nWB2yk8pyoJadR*.7kCMdnj",
            ),
          ),
          Center(
            child: Text(
              'Home',
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
          )
        ],
      ),
    );
  }
}
