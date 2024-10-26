import 'package:flutter_modular/flutter_modular.dart';
import 'package:lotus/src/modules/home/modules/computador/bloc/computador/computador_bloc.dart';
import 'package:lotus/src/modules/home/modules/computador/bloc/computadores/computadores_bloc.dart';
import 'package:lotus/src/modules/home/modules/computador/pages/computador_page.dart';
import 'package:lotus/src/modules/home/modules/computador/pages/computadores_page.dart';
import 'package:lotus/src/modules/home/nested_module.dart';
import 'package:repositories/repositories.dart';

/// Módulo de ativos de TI (lista, detalhes, etc.).
class ComputadorModule extends Module {
  @override
  List<Module> get imports => [NestedModule()];

  @override
  void binds(Injector i) {
    i
      ..addLazySingleton<ComputadorRepository>(ComputadorRepository.new)
      ..add<ComputadoresBloc>(ComputadoresBloc.new)
      ..add<ComputadorBloc>(ComputadorBloc.new);
  }

  @override
  void routes(RouteManager r) {
    r
      ..child(
        '/',
        child: (_) => ComputadoresPage(
          computadoresBloc: Modular.get(),
        ),
      )
      ..child(
        '/:id',
        child: (_) => ComputadorPage(
          computadorBloc: Modular.get(),
          id: int.parse(r.args.params['id'] as String),
        ),
      );
  }
}
