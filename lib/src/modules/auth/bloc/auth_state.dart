part of 'auth_bloc.dart';

/// {@template auth_state}
/// An abstract class representing authentication states.
/// {@endtemplate}
sealed class AuthState extends Equatable {
  const AuthState({required this.isAdmin});

  /// Whether the user is an admin.
  final bool isAdmin;

  @override
  List<Object> get props => [
        isAdmin,
      ];
}

/// {@template auth_initial}
/// The initial authentication state.
/// {@endtemplate}
class LoggedOut extends AuthState {
  /// {@macro auth_initial}
  const LoggedOut() : super(isAdmin: false);
}

/// {@template auth_success}
/// The authentication state when the user is authenticated.
/// {@endtemplate}
class LoggedIn extends AuthState {
  /// {@macro auth_success}
  const LoggedIn() : super(isAdmin: true);
}
