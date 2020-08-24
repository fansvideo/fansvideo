import 'package:fansvideo/widgets/icon_with_text.dart';
import 'package:fansvideo/widgets/image_with_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RightMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Positioned(
      top: 200,
      right: 0,
      bottom: 55,
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
                      'assets/icons/profile.png',
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
            IconWithText(
              iconData: CupertinoIcons.heart,
              text: '3.2K',
//              color: Colors.pink,
            ),
            ImageWithText(
              image: AssetImage('assets/icons/student_icon.png'),
              text: '32K',
            ),
//            IconWithText(
//              iconData: CupertinoIcons.person_solid,
//              text: '3.2K',
//            ),
            IconWithText(
              iconData: CupertinoIcons.share_up,
              text: '分享',
            ),
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  'assets/icons/album.png',
                  width: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
