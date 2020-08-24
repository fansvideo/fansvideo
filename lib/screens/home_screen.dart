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
            top: 200,
            right: 0,
            bottom: 70,
            child: Container(
              width: 70,
              height: size.height,
              decoration: BoxDecoration(
//                color: Colors.red.withOpacity(.7),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    overflow: Overflow.visible,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.asset(
                            'assets/images/bg.png',
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -10,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.pinkAccent,
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    CupertinoIcons.heart_solid,
                    color: Colors.pink,
                    size: 40,
                  ),

                  Icon(
                    CupertinoIcons.person_solid,
                    color: Colors.white,
                    size: 40,
                  ),

                  Icon(
                    CupertinoIcons.share_up,
                    color: Colors.white,
                    size: 40,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueGrey, width: 3),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.cyanAccent,
                      radius: 25,
                      backgroundImage: AssetImage("assets/images/2.jpg"),
                    ),
                  ),
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
