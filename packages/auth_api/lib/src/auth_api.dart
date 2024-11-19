/// {@template auth_api}
/// An API for authentication.
/// {@endtemplate}
base class AuthApi {
  /// Logs in the user.
  Future<bool> login() async {
    throw UnimplementedError();
  }

  /// Logs out the user.
  Future<void> logout() async {
    throw UnimplementedError();
  }
}

/// {@template fake_auth_api}
/// A fake implementation of [AuthApi].
/// {@endtemplate}
final class FakeAuthApi implements AuthApi {
  @override
  Future<bool> login() async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 50), () {});
    return true;
  }

  @override
  Future<void> logout() async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 50), () {});
  }
}
