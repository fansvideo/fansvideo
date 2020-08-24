import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/screens.dart';

void main() {
  runApp(FansVideoApp());
}

class FansVideoApp extends StatefulWidget {
  // This widget is the root of your application.
  final screens = [
    HomeScreen(),
    SearchScreen(),
    Scaffold(
      body: Center(
          child: Text(
        'add',
        style: TextStyle(color: Colors.white, fontSize: 40),
      )),
    ),
    Scaffold(
      body: Center(
          child: Text(
        'message',
        style: TextStyle(color: Colors.white, fontSize: 40),
      )),
    ),
    Scaffold(
      body: Center(
          child: Text(
        'profile',
        style: TextStyle(color: Colors.white, fontSize: 40),
      )),
    ),
  ];

  @override
  _FansVideoAppState createState() => _FansVideoAppState();
}

class _FansVideoAppState extends State<FansVideoApp> {
  int _selectedIndex;
  final List<IconData> navs = [
    Icons.home,
    Icons.search,
    Icons.add_box,
    Icons.message,
    Icons.person,
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
//    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.pinkAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: Theme.of(context)
            .textTheme
            .apply(bodyColor: Colors.white, displayColor: Colors.white),
        canvasColor: Colors.transparent,
      ),
      home: AnnotatedRegion(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                child: widget.screens[_selectedIndex],
              ),
//              Container(
//                decoration: BoxDecoration(
//                  gradient: LinearGradient(
//                    begin: Alignment.bottomCenter,
//                    end: Alignment.topCenter,
//                    colors: [
//                      Colors.black26,
//                      Colors.black12,
//                      Colors.black12,
//                      Colors.black12,
//                    ],
//                    stops: [0.01, 0.8, 0.9, 1],
//                    tileMode: TileMode.clamp,
//                  ),
//                ),
//              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  iconSize: 32,
                  fixedColor: Colors.white,
                  unselectedItemColor: Colors.white54,
                  showUnselectedLabels: false,
                  showSelectedLabels: false,
                  currentIndex: _selectedIndex,
                  elevation: 0,
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(navs[0]),
                      title: Text('首页'),
                      activeIcon: Icon(navs[0]),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(navs[1]),
                      title: Text('搜索'),
                      activeIcon: Icon(navs[1]),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(navs[2]),
                      title: Text('上传'),
                      activeIcon: Icon(navs[2]),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(navs[3]),
                      title: Text('评论'),
                      activeIcon: Icon(navs[3]),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(navs[4]),
                      title: Text('我的'),
                      activeIcon: Icon(navs[4]),
                    ),
                  ],
                  onTap: (index) => setIndex(index),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  setIndex(int i) {
    setState(() => _selectedIndex = i);
  }
}
