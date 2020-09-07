import 'package:fansvideo/blocs/cubits/cubits.dart';
import 'package:fansvideo/repository/auth_repository.dart';
import 'package:fansvideo/screens/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavScreen extends StatefulWidget {
  final AuthRepository authRepository;


  NavScreen({Key key, this.authRepository})
      : assert(authRepository != null),
        super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {

  // This widget is the root of your application.
  final _screens = [
    HomeScreen(key: PageStorageKey('home'),),
    PopularScreen(),
    AddScreen(),
    MessageScreen(),
    MyScreen(),
  ];

  final Map<String, IconData> _icons = const {
    '首页': Icons.home,
    '热门': Icons.collections,
    '上传': Icons.add_box,
    '评论': Icons.message,
    '我的': Icons.person,
  };

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var deviceType = getDeviceType(size);
    bool hasBottomNav = false;
    switch (deviceType) {
      case DeviceScreenType.desktop:
        hasBottomNav = false;
        break;
      case DeviceScreenType.tablet:
        hasBottomNav = true;
        break;
      case DeviceScreenType.mobile:
        hasBottomNav = true;
        break;
      case DeviceScreenType.watch:
        break;
      case DeviceScreenType.Mobile:
        break;
      case DeviceScreenType.Tablet:
        break;
      case DeviceScreenType.Desktop:
        break;
      case DeviceScreenType.Watch:
        break;
    }

    return Scaffold(
      body: BlocProvider<AppBarCubit>(
        create: (_) => AppBarCubit(),
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: hasBottomNav
          ? BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
//        backgroundColor: Colors.black,
        items: _icons
            .map((title, icon) => MapEntry(
            title,
            BottomNavigationBarItem(
              icon: Icon(icon, size: 30.0),
              title: Text(title),
            )))
            .values
            .toList(),
        currentIndex: _currentIndex,
        selectedFontSize: 11.0,
        unselectedFontSize: 11.0,
        onTap: (index) => setState(() => _currentIndex = index),
      )
          : null,
    );
  }
}
