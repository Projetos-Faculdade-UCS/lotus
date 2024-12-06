import 'package:auth_api/auth_api.dart';

/// {@template auth_repository}
/// A repository for authentication.
/// {@endtemplate}
class AuthRepository {
  /// {@macro auth_repository}
  AuthRepository(this._authApi);
  final AuthApi _authApi;

  /// Logs in the user.
  Future<bool> login() async {
    return _authApi.login();
  }

  /// Logs out the user.
  Future<void> logout() async {
    return _authApi.logout();
  }
}
