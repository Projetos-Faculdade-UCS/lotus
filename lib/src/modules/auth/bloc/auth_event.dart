part of 'auth_bloc.dart';

/// {@template auth_event}
/// An abstract class representing authentication events.
/// {@endtemplate}
sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

/// {@template login}
/// An event which triggers the login process.
/// {@endtemplate}
class Login extends AuthEvent {
  /// {@macro login}
  const Login();
}

/// {@template logout}
/// An event which triggers the logout process.
/// {@endtemplate}
class Logout extends AuthEvent {
  /// {@macro logout}
  const Logout();
}
