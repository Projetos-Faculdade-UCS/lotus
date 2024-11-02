import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repositories/repositories.dart';

part 'auth_event.dart';
part 'auth_state.dart';

/// {@template auth_bloc}
/// A [Bloc] which manages the authentication state.
/// {@endtemplate}
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  /// {@macro auth_bloc}
  AuthBloc(this._repository) : super(const LoggedOut()) {
    on<Login>(_login);
    on<Logout>(_logout);
  }

  final AuthRepository _repository;

  Future<void> _login(Login event, Emitter<AuthState> emit) async {
    final success = await _repository.login();
    if (success) {
      emit(const LoggedIn());
    }
  }

  Future<void> _logout(Logout event, Emitter<AuthState> emit) async {
    await _repository.logout();
    emit(const LoggedOut());
  }
}
