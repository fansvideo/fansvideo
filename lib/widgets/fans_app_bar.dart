import 'package:fansvideo/blocs/bloc_auth/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FansAppBar extends StatelessWidget {
  final double scrollOffset;

  const FansAppBar({Key key, this.scrollOffset = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
      color:
          Colors.white.withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      child: ScreenTypeLayout(
        mobile: _FansAppBarMobile(),
        desktop: _FansAppBarDesktop(),
      ),
    );
  }
}

class _FansAppBarDesktop extends StatefulWidget {
  @override
  __FansAppBarDesktopState createState() => __FansAppBarDesktopState();
}

class __FansAppBarDesktopState extends State<_FansAppBarDesktop> {
  TextEditingController searchController = TextEditingController();

  void _listener() {
    if (_focusNode.hasFocus) {
    } else {
      searchController.clear();
    }
  }

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode()..addListener(_listener);
  }

  FocusNode _focusNode;

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset('assets/images/fansvideo.png'),
          SizedBox(
            width: 40,
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(
                  title: '关于我们',
                  onTap: () {},
                ),
                _AppBarButton(
                  title: '所有课程',
                  onTap: () {},
                ),
                _AppBarButton(
                  title: '产品介绍',
                  onTap: () {},
                ),
                _AppBarButton(
                  title: '博客',
                  onTap: () {},
                ),
                _AppBarButton(
                  title: '联系我们',
                  onTap: () {},
                ),
              ],
            ),
          ),
          SizedBox(
            width: 40,
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
//              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  decoration: BoxDecoration(
//                    color: Colors.red.withOpacity(.4)
                      ),
                  child: TextField(
                    maxLines: 1,
                    controller: searchController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 22, left: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: Colors.pinkAccent),
                      ),
                      hintText: '搜索课程',
//                      contentPadding:
//                          EdgeInsets.only(top: 20, left: 10, right: 10),
                      suffixIcon: Icon(
                        CupertinoIcons.search,
                        color: Colors.pinkAccent,
                      ),
                      hintStyle: TextStyle(fontSize: 10),
                      filled: true,
                      fillColor: Colors.transparent,
                    ),
                    autofocus: false,
                    focusNode: _focusNode,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    Widget userProfile;
                    state.maybeWhen(isLogin: (isLogin, idToken) {
                      Map<String, dynamic> decodedToken =
                          JwtDecoder.decode(idToken);
                      if (decodedToken != null) {
                        String profileImg = decodedToken['picture'];
//                        String nickName = decodedToken['nickname'];
                        userProfile = Tooltip(
                          message: "退出",
                          child: InkWell(
                            onTap: () {
                              BlocProvider.of<AuthBloc>(context)
                                  .add(AuthEvent.logOut());
                            },
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(profileImg),
                            ),
                          ),
                        );
                      } else {
                        userProfile = Tooltip(
                          message: "登录",
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('login');
                            },
                            child: Icon(
                              CupertinoIcons.profile_circled,
                              size: 40,
                            ),
                          ),
                        );
                      }
                    }, orElse: () {
                      userProfile = Tooltip(
                        message: "登录",
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('login');
                          },
                          child: Icon(
                            CupertinoIcons.profile_circled,
                            size: 40,
                          ),
                        ),
                      );
                    });
                    return userProfile;
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _FansAppBarMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset('assets/images/logo.png'),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(title: '所有课程', onTap: () {}),
                _AppBarButton(title: '最热排行', onTap: () {}),
                _AppBarButton(title: '我的课程', onTap: () {}),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _AppBarButton extends StatelessWidget {
  final String title;
  final Function onTap;

  const _AppBarButton({Key key, @required this.title, @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        title,
        style: TextStyle(
            color: Colors.pink, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
