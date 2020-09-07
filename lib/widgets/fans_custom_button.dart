import 'package:flutter/material.dart';

class FansCustomButton extends StatelessWidget {
  final Function onPress;
  final String text;
  final IconData icon;

  const FansCustomButton({Key key, this.onPress, this.text, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.0),
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.pink,
        ),
        child: SizedBox(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon != null ? Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Icon(icon, color: Colors.white, size: 28,),
              ) : null,

              Text(
                text,
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        //Text(widget.text, style: TextStyle(color: Colors.white, fontSize: 16),),
      ),
    );
  }
}
