import 'package:fansvideo/models/auth0_info.dart';
import 'package:fansvideo/providers/auth_provider.dart';
import 'package:meta/meta.dart';

class AuthRepository {
  final AuthApiClient apiClient;

  AuthRepository({@required this.apiClient}) : assert(apiClient != null);

  Future<Auth0Info> getAuth0Info() async => await apiClient.getAuth0Info();
}
