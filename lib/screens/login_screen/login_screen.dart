import 'package:fansvideo/widgets/blurhash_image.dart';
import 'package:flutter/material.dart';

// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  final String currentUrl;

  const LoginScreen({Key key, this.currentUrl}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _status = '';

  String returnUrl;

  @override
  void initState() {
    super.initState();
    returnUrl = js.context['location']['href'];
    print(returnUrl);
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
                onPressed: launchURL,
              ),
              FlatButton(
                child: Text('注册'),
                onPressed: (){},
              ),
            ],
          ),
        ],
      ),
    );
  }


  void launchURL() async {
    var callbackUrl = widget.currentUrl.substring(0,widget.currentUrl.indexOf('/#'));
    print(callbackUrl);
    String url = 'https://fansvideo.us.auth0.com/authorize?client_id=wppS3LEtuk3Dk8qODXxXuclQ4D60HsrF&protocol=oauth2&response_type=token&redirect_uri=$callbackUrl&scope=openid%20profile';
    if (await canLaunch(url)) {
      await launch(url, webOnlyWindowName: '_self');
    } else {
      throw 'Could not launch $url';
    }
  }
}
