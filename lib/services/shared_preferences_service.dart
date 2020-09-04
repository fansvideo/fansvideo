import 'package:fansvideo/models/auth0_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  SharedPreferences _prefs;

  Future<bool> getSharedPreferencesInstance() async {
    _prefs = await SharedPreferences.getInstance().catchError((e) {
      print("shared prefrences error : $e");
      return false;
    });
    return true;
  }

  Future setIdToken(String token) async {
    await _prefs.setString('id_token', token);
  }

  Future setAccessToken(String token) async {
    await _prefs.setString('access_token', token);
  }

  Future setExpiresIn(int expiresIn) async {
    await _prefs.setInt('expires_in', expiresIn);
  }

  Future clearToken() async {
    await _prefs.clear();
  }

  Future<String> get idToken async => _prefs.getString('id_token') ?? '';
  Future<String> get accessToken async => _prefs.getString('access_token');
  Future<int> get expiresIn async => _prefs.getInt('expires_in');
}

SharedPreferenceService sharedPreferenceService = SharedPreferenceService();
