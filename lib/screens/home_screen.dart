import 'package:fansvideo/screens/widgets/right_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          RightMenu(),
          Positioned(
            left: 20,
            bottom: 70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('@用户 01'),
                SizedBox(height: 4,),
                Text('江南又下雨，你们那里下雨了吗？'),
                SizedBox(height: 4,),
                Row(
                  children: [
                    Icon(Icons.music_note, color: Colors.white, size: 16,),
                    SizedBox(width: 4,),
                    Text('你莫走(DJ版)-山水组合'),
                  ],
                ),
              ],
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
