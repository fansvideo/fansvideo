import 'package:fansvideo/utils/utils.dart';
import 'package:fansvideo/widgets/blurhash_image.dart';
import 'package:flutter/material.dart';

// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

class LoginScreen extends StatefulWidget {
  final String currentUrl;

  const LoginScreen({Key key, this.currentUrl}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
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
              'Login Page',
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
          ),
          Row(
            children: [
              FlatButton(
                child: Text('登录'),
                onPressed: () => launchLoginURL(widget.currentUrl),
              ),
              FlatButton(
                child: Text('注册'),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
