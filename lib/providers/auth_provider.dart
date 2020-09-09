import 'dart:async';
import 'dart:convert';
import 'package:fansvideo/models/auth0_info.dart';
import 'package:fansvideo/services/shared_preferences_service.dart';
import 'package:fansvideo/utils/utils.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:http/http.dart' as http;

class AuthApiClient {
  final String clientId, redirectUrl, authzEndpoint, tokenEndpoint;
  final List<String> scopes;
  String discoveryUrl;
  FlutterAppAuth authClient;

  // Default configs for using the demo.identityserver.io ConnectId service
  // Either use the discoveryUrl or the authzEndpoint and tokenEndpoint (to skip discovery)
  static const String _clientId = 'interactive.public.short';
  static const String _redirectUrl = 'io.actingweb.firstapp:/oauthredirect';
  static const String _discoveryUrl =
      'https://demo.identityserver.io/.well-known/openid-configuration';
  static const List<String> _scopes = <String>[
    'openid',
    'profile',
    'email',
    'offline_access',
    'api'
  ];

  // End default configs

  AuthApiClient(
      {this.authClient,
      this.clientId: _clientId,
      this.redirectUrl: _redirectUrl,
      this.discoveryUrl,
      this.authzEndpoint,
      this.tokenEndpoint,
      this.scopes: _scopes}) {
    if (authClient == null) {
      authClient = FlutterAppAuth();
    }
    // If no server URLs are supplied, use the demo service
    if (discoveryUrl == null && this.authzEndpoint == null) {
      discoveryUrl = _discoveryUrl;
    }
  }

  Future<Auth0Info> getAuth0Info() async {
    await sharedPreferenceService.getSharedPreferencesInstance();
    var idToken = await sharedPreferenceService.idToken;
    var accessToken = await sharedPreferenceService.accessToken;
    var expiresIn = await sharedPreferenceService.expiresIn;
    return Auth0Info(
        idToken: idToken, accessToken: accessToken, expiresIn: expiresIn);
  }

  Future<void> authLogout() async {
    print('authLogout =======> ');

    final callback = 'http://localhost:58711/';
    await launchLogoutURL(callback);
  }

  Future<dynamic> getUserInfo(accessToken) async {
    if (accessToken == null) {
      return null;
    }
    String _userInfo;
    try {
      final http.Response httpResponse = await http.get(
          'https://demo.identityserver.io/api/test',
          headers: <String, String>{'Authorization': 'Bearer $accessToken'});
      _userInfo = httpResponse.statusCode == 200 ? httpResponse.body : '';
      if (_userInfo.length == 0) {
        return null;
      }

      return json.decode(_userInfo);
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  Future<Map<dynamic, dynamic>> refreshToken(refreshToken) async {
    if (refreshToken == null) {
      return null;
    }
    try {
      final TokenResponse _result = await authClient.token(TokenRequest(
          _clientId, _redirectUrl,
          refreshToken: refreshToken,
          discoveryUrl: _discoveryUrl,
          scopes: _scopes));
      return Map.from({
        'access_token': _result.accessToken,
        'expires': _result.accessTokenExpirationDateTime,
        'id_token': _result.idToken,
        'refresh_token': _result.refreshToken,
        'additional_params': _result.tokenAdditionalParameters,
      });
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  Future<Map<dynamic, dynamic>> authorize() async {
    try {
      AuthorizationTokenResponse _result;
      if (this.discoveryUrl == null) {
        _result = await authClient.authorizeAndExchangeCode(
          AuthorizationTokenRequest(
            clientId,
            redirectUrl,
            serviceConfiguration:
                AuthorizationServiceConfiguration(authzEndpoint, tokenEndpoint),
            scopes: this.scopes,
          ),
        );
      } else {
        _result = await authClient.authorizeAndExchangeCode(
          AuthorizationTokenRequest(
            clientId,
            redirectUrl,
            discoveryUrl: discoveryUrl,
            scopes: this.scopes,
          ),
        );
      }
      if (_result != null && _result.accessToken != null) {
        return Map.from({
          'access_token': _result.accessToken,
          'expires': _result.accessTokenExpirationDateTime,
          'id_token': _result.idToken,
          'refresh_token': _result.refreshToken,
          'additional_params': _result.authorizationAdditionalParameters,
        });
      }
    } catch (e) {
      print('Error: $e');
    }
    return Map.from({});
  }
}
