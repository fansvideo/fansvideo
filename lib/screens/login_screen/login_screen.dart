import 'dart:ui';

import 'package:fansvideo/screens/home/widgets/top_banner.dart';
import 'package:fansvideo/utils/constants.dart';
import 'package:fansvideo/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(size.width, 60),
        child: Container(
          height: 60,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Tooltip(
                      message: '返回',
                      child: Image.asset('assets/images/fansvideo.png'))),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          FractionallySizedBox(
            heightFactor: topMark,
            child: TopBanner(
              bannerUrl: 'assets/images/banner/banner02.jpg',
              bannerHash: r'L9Lzs,4Tpe%g_200o}.mo~%gRiMx',
            ),
          ),
          Align(
            alignment: Alignment(.7, .6),
            child: Stack(
              children: [
                Opacity(
                  opacity: .3,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            'assets/images/logo_bg.png',
                          )),
                    ),
                    width: 550,
                  ),
                ),
                Container(
                  width: 550,
                  padding: EdgeInsets.all(50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        '点击Logo云端登录',
                        style: TextStyle(fontSize: 30),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 170),
                          child: IconButton(
                              iconSize: 200,
                              color: aliPayColor,
                              icon: Tooltip(
                                  message: '点击登录',
                                  child: Image.asset(
                                      'assets/images/login_button.png')),
                              onPressed: () => launchLoginURL(widget.currentUrl)),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Wrap(
                        spacing: 4,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            '其它登录方式：',
                            style: TextStyle(fontSize: 18),
                          ),
                          IconButton(
                              color: weChatColor,
                              iconSize: 42,
                              icon: Tooltip(
                                  message: '使用微信登录',
                                  child: FaIcon(FontAwesomeIcons.weixin)),
                              onPressed: () {}),
                          IconButton(
                              color: aliPayColor,
                              iconSize: 42,
                              icon: Tooltip(
                                  message: '使用支付宝登录',
                                  child: FaIcon(FontAwesomeIcons.alipay)),
                              onPressed: () {}),
                          IconButton(
                            color: weiboColor,
                            iconSize: 42,
                            icon: Tooltip(
                                message: '使用微博登录',
                                child: FaIcon(FontAwesomeIcons.weibo)),
                            onPressed: () {},
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ]
            ),
          )
        ],
      ),
    );
  }
}
