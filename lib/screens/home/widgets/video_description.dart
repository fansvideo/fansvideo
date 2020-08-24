import 'package:flutter/material.dart';

class VideoDescription extends StatelessWidget {
  const VideoDescription({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20,
      bottom: 70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('@用户 01'),
          SizedBox(
            height: 4,
          ),
          Text('江南又下雨，你们那里下雨了吗？'),
          SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Icon(
                Icons.music_note,
                color: Colors.white,
                size: 16,
              ),
              SizedBox(
                width: 4,
              ),
              Text('你莫走(DJ版)-山水组合'),
            ],
          ),
        ],
      ),
    );
  }
}
