import 'package:auth_api/auth_api.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lotus/src/modules/auth/bloc/auth_bloc.dart';
import 'package:repositories/repositories.dart';

/// {@template auth_module}
/// A module that exports an [AuthApi] implementation.
/// {@endtemplate}
class AuthModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i
      ..addSingleton<AuthApi>(FakeAuthApi.new)
      ..addSingleton<AuthRepository>(AuthRepository.new)
      ..addSingleton<AuthBloc>(AuthBloc.new);
  }
}
