
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RightMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Positioned(
      top: 200,
      right: 0,
      bottom: 45,
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
            Column(
              children: [
                Icon(
                  CupertinoIcons.heart_solid,
                  color: Colors.pink,
                  size: 40,
                ),
                Text('3.2K'),
              ],
            ),

            Column(
              children: [
                Icon(
                  CupertinoIcons.person_solid,
                  color: Colors.white,
                  size: 40,
                ),
                Text('3.2K'),
              ],
            ),

            Column(
              children: [
                Icon(
                  CupertinoIcons.share_up,
                  color: Colors.white,
                  size: 40,
                ),
                Text('分享'),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black87.withAlpha(95), width: 8),
                borderRadius: BorderRadius.circular(28),
              ),
              child: CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage("assets/images/2.jpg"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}