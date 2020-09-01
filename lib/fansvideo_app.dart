import 'package:fansvideo/graphql/fans_graphql_provide.dart';
import 'package:fansvideo/screens/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

String get host => 'localhost';

class FansVideoApp extends StatefulWidget {
  // This widget is the root of your application.
  final screens = [
    HomeScreen(),
    PopularScreen(),
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
    CupertinoIcons.collections,
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
    return FansGraphqlProvider(
//      uri: 'http://$host:9002/graphql',
      uri: 'https://fansvideo-hasura.herokuapp.com/v1/graphql',
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fans Video',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.black87,
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
//                  showUnselectedLabels: true,
//                  showSelectedLabels: false,
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
                        title: Text('热门'),
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
      ),
    );
  }

  setIndex(int i) {
    setState(() => _selectedIndex = i);
  }
}
