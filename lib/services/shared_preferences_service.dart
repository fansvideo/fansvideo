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

  Future setToken(String token) async {
    await _prefs.setString('token', token);
  }

  Future clearToken() async {
    await _prefs.clear();
  }

  Future<String> get token async => 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InJRejJKWXBPa0VlbVI4bDNzRGxIVyJ9.eyJodHRwczovL2hhc3VyYS5pby9qd3QvY2xhaW1zIjp7IngtaGFzdXJhLWRlZmF1bHQtcm9sZSI6InVzZXIiLCJ4LWhhc3VyYS1hbGxvd2VkLXJvbGVzIjpbInVzZXIiLCJlZGl0b3IiXSwieC1oYXN1cmEtdXNlci1pZCI6ImF1dGgwfDVmNGI4YTNiYzY0NzhiMDA2N2Q4NzI1MCJ9LCJuaWNrbmFtZSI6InRlc3QwMSIsIm5hbWUiOiJ0ZXN0MDFAdGVzdC5jb20iLCJwaWN0dXJlIjoiaHR0cHM6Ly9zLmdyYXZhdGFyLmNvbS9hdmF0YXIvODhmMmZlNGJkY2RjYzMzNDBkYzhmMDhkMGE0Y2YzNjM_cz00ODAmcj1wZyZkPWh0dHBzJTNBJTJGJTJGY2RuLmF1dGgwLmNvbSUyRmF2YXRhcnMlMkZ0ZS5wbmciLCJ1cGRhdGVkX2F0IjoiMjAyMC0wOC0zMFQxNzowMzo1Ni44NDFaIiwiaXNzIjoiaHR0cHM6Ly9mYW5zdmlkZW8udXMuYXV0aDAuY29tLyIsInN1YiI6ImF1dGgwfDVmNGI4YTNiYzY0NzhiMDA2N2Q4NzI1MCIsImF1ZCI6IndwcFMzTEV0dWszRGs4cU9EWHhYdWNsUTRENjBIc3JGIiwiaWF0IjoxNTk4ODA3MjM0LCJleHAiOjE1OTg4NDMyMzR9.NVUUL9diE_G4WrLZ9Wp7s4J9N9xS0BZW4xRDeu7CwB-YhjGYHDgRjcY-PnzmGztCINmpiMvsmyGlr-E1SbNPm4-G6BE-OR5yeRq0xhQv4apNeiXfEV-I7C9lnJ5P-N71-qGJPu-7FrYdedWsQWHch9afA5Iy_ziZypCFqdTao3jiPKZjgr1kjRMGz3rFmVy90zsx1U-yCoKVfXpM3ImI3-sylfRGNPbB_4u-dJpMnfwyUmaSry9rnoAk8i6HbAPM_KMxF51lg0eGhud5uypMvMF56Y97mQ37mLlus-IDp5ZF2KgLmi1s55E8vz8pmpKSC0QXVQ8f9PHFmFOmnNoF9w';//_prefs.getString('token');
}

SharedPreferenceService sharedPreferenceService = SharedPreferenceService();
