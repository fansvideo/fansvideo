import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:url_launcher/url_launcher.dart';

const String clientId = 'wppS3LEtuk3Dk8qODXxXuclQ4D60HsrF';
const String authUrl = 'https://fansvideo.us.auth0.com/authorize';
void launchLoginURL(String currentUrl) async {
  var callbackUrl =
      currentUrl.substring(0, currentUrl.indexOf('/#'));
  String url =
      '$authUrl?client_id=$clientId&protocol=oauth2&response_type=token&redirect_uri=$callbackUrl&scope=openid%20profile';
  if (await canLaunch(url)) {
    await launch(url, webOnlyWindowName: '_self');
  } else {
    throw 'Could not launch $url';
  }
}

String getUserProfile(String token) {
  Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
  return decodedToken['picture'];
}
