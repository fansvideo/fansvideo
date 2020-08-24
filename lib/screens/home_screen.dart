import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _selectTab;

  @override
  void initState() {
    super.initState();
    _selectTab = 1;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/2.jpg'), fit: BoxFit.cover),
            ),
          ),
          Positioned(
            child: buildTab(),
          ),
          Positioned(
            top: 350,
            right: 0,
            bottom: 70,
            child: Container(
              width: 70,
              height: size.height,
              decoration: BoxDecoration(
//                color: Colors.red.withOpacity(.7),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.pinkAccent.withOpacity(.8),
                    radius: 50,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildTab() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => setTab(0),
            child: Text(
              '关注',
              style: TextStyle(
                color: (_selectTab == 0)
                    ? Colors.white.withOpacity(.8)
                    : Colors.white.withOpacity(.6),
                fontSize: 24,
                fontWeight: (_selectTab == 0) ? FontWeight.bold : null,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: () => setTab(1),
            child: Text(
              '热门',
              style: TextStyle(
                  color: (_selectTab == 1)
                      ? Colors.white.withOpacity(.8)
                      : Colors.white.withOpacity(.6),
                  fontSize: 24,
                  fontWeight: (_selectTab == 1) ? FontWeight.bold : null),
            ),
          ),
        ],
      ),
    );
  }

  setTab(double i) {
    setState(() => _selectTab = i);
  }
}
