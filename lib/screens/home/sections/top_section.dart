import 'package:fansvideo/blocs/cubits/app_bar/app_bar_cubit.dart';
import 'package:fansvideo/utils/constants.dart';
import 'package:fansvideo/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<AppBarCubit, double>(
    builder: (context, scrollOffset) {
      return Align(
        heightFactor: topMark,
        alignment: Alignment(-.8, -.1),
        child: Container(
          height: size.height - 60,
//                      color: Colors.pink.withOpacity(.6),
//                margin: EdgeInsets.only(top: 100),
          child: Header(progression: scrollOffset.clamp(0, 1,)),
        ),
      );
    }
    );
  }
}
