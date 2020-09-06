import 'package:fansvideo/blocs/bloc_auth/bloc.dart';
import 'package:fansvideo/graphql/fans_graphql_provide.dart';
import 'package:fansvideo/providers/auth_provider.dart';
import 'package:fansvideo/repository/auth_repository.dart';
import 'package:fansvideo/screens/nav_screen.dart';
import 'package:fansvideo/screens/screens.dart';
import 'package:fansvideo/services/shared_preferences_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

import 'package:flutter_bloc/flutter_bloc.dart';

String get host => 'localhost';

class FansVideoApp extends StatefulWidget {
  @override
  _FansVideoAppState createState() => _FansVideoAppState();
}

class _FansVideoAppState extends State<FansVideoApp> {
  String currentUrl;

  final authRepository = AuthRepository(
      apiClient: AuthApiClient()
  );

  @override
  void initState() {
    super.initState();
    currentUrl = js.context['location']['href'];
    refreshIdToken(currentUrl);
  }

  ///刷新token 保存token到本地，使用token获取数据
  Future<void> refreshIdToken(String callbackUrl) async {
    Uri uri = Uri.parse(callbackUrl.replaceFirst('#', '?'));
    Map<String, String> qp = uri.queryParameters;
    var idToken = qp['id_token'] ?? '';
    if (idToken != '') {
      await sharedPreferenceService.getSharedPreferencesInstance();
      sharedPreferenceService.setIdToken(idToken);
      sharedPreferenceService.setAccessToken(qp['access_token']);
      sharedPreferenceService.setExpiresIn(int.parse(qp['expires_in']));
    }
  }

  @override
  Widget build(BuildContext context) {
//    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    return FansGraphqlProvider(
//      uri: 'http://$host:9002/graphql',
      uri: 'https://fansvideo-hasura.herokuapp.com/v1/graphql',
      subscriptionUri: 'ws://fansvideo-hasura.herokuapp.com/v1/graphql',
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fans Video',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          scaffoldBackgroundColor: Colors.black87,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: Theme.of(context)
              .textTheme
              .apply(bodyColor: Colors.white, displayColor: Colors.white),
          canvasColor: Colors.transparent,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
            selectedItemColor: Colors.pink,
            unselectedItemColor: Colors.black54,
          )
        ),
        routes: {
          'login': (_) => LoginScreen(
                currentUrl: currentUrl,
              ),
          'my': (_) => MyScreen(),
        },
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthBloc(repository: authRepository)
                ..add(AuthInitialEvent()),
            )
          ],
          child: AnnotatedRegion(
            value: SystemUiOverlayStyle.light,
            child: NavScreen(authRepository: authRepository,),
          ),
        ),
      ),
    );
  }
}
