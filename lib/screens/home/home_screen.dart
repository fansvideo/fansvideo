import 'package:fansvideo/bloc_auth/bloc.dart';
import 'package:fansvideo/widgets/blurhash_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget showView;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                state.when(checkIdToken: () {
                  showView = Center(child: CircularProgressIndicator());
                }, isLogin: (isLogin, idToken) {
                  if (isLogin) {
                    Map<String, dynamic> decodedToken =
                        JwtDecoder.decode(idToken);
                    String profileImg = decodedToken['picture'];
                    showView = InkWell(
                      borderRadius: BorderRadius.circular(25),
                      hoverColor: Colors.blue,

                      onTap: () => BlocProvider.of<AuthBloc>(context)
                          .add(AuthEvent.logOut()),
                      child: Tooltip(
                        message: '退出',
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(profileImg),
                        ),
                      ),
                    );
                  } else {
                    showView = IconButton(
                      tooltip: '登录',
                      icon: Icon(
                        CupertinoIcons.profile_circled,
                        color: Colors.white,
                      ),
                      onPressed: () async {
                        Navigator.of(context).pushNamed('login');
                      },
                    );
                  }
                }, error: () {
                  showView = IconButton(
                    tooltip: '登录',
                    icon: Icon(
                      CupertinoIcons.profile_circled,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('login');
                    },
                  );
                }, logOut: () {
                  showView = IconButton(
                    tooltip: '登录',
                    icon: Icon(
                      CupertinoIcons.profile_circled,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('login');
                    },
                  );
                });
                return showView;
              },
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: FansBlurHashImage(
              hash: "LEHV6nWB2yk8pyoJadR*.7kCMdnj",
            ),
          ),
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              state.when(
                  checkIdToken: () {},
                  isLogin: (_, idToken) {},
                  error: () {},
                  logOut: () {});
            },
            builder: (context, state) {
              Widget returnView;
              state.when(checkIdToken: () {
                returnView = Center(child: CircularProgressIndicator());
              }, isLogin: (isLogin, idToken) {
                Map<String, dynamic> decodedToken = JwtDecoder.decode(idToken);
                if (decodedToken != null) {
                  String profileImg = decodedToken['picture'];
                  String nickName = decodedToken['nickname'];
                  returnView = Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        width: 50,
                        image: NetworkImage(profileImg),
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('欢迎回来，$nickName'),
                    ],
                  ));
                } else {
                  returnView = Center(
                    child: Text('请点击右上角登录!'),
                  );
                }
              }, error: () {
                returnView = Center(child: Text('出错啦~'));
              }, logOut: () {
                returnView = Center(child: Text('未登录~'));
              });
              return returnView;
            },
          ),
        ],
      ),
    );
  }
}
