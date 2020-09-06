import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fansvideo/blocs/bloc_auth/bloc.dart';
import 'package:fansvideo/models/auth0_info.dart';
import 'package:fansvideo/repository/auth_repository.dart';
import 'package:fansvideo/services/shared_preferences_service.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc({this.repository})
      : assert(repository != null),
        super(AuthState.checkIdToken());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) {
    return event.when(initial: () async* {
      try {
        yield AuthState.checkIdToken();
        final auth0info = await repository.getAuth0Info();
        String token = auth0info.idToken;
        yield AuthState.isLogin(
            !JwtDecoder.isExpired(token), auth0info.idToken);
      } catch (error) {
        yield AuthState.error();
      }
    }, logOut: () async* {
      await sharedPreferenceService.clearToken();
      yield AuthState.logOut();
    });
  }
}

//    return event.when(
//        initial: () async* {
//          try {
//            yield AuthState.checkIdToken();
//            final auth0info = await repository.getAuth0Info();
//            yield AuthState.isLogin(isLogin, idToken)
//          } catch (_) {
//            yield AuthState.error();
//          }
//        },
//        logOut: () async* => yield AuthState.logOut());

//try {
//final Auth0Info auth0info = repository.getAuth0Info();
//String token = auth0info.idToken;
//AuthState.isLogin(!JwtDecoder.isExpired(token), auth0info.idToken);
//} catch (_) {
//AuthState.error();
//event.when(initial: () {
//AuthState.checkIdToken();
//}, logOut: () {
//sharedPreferenceService.clearToken();
//AuthState.logOut();
//});
//}
