import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lotus/src/modules/home/modules/computador/bloc/computadores/computadores_bloc.dart';
import 'package:lotus/src/modules/home/modules/computador/pages/computadores_page.dart';
import 'package:lotus/src/modules/home/nested_module.dart';
import 'package:lotus/src/modules/home/widgets/breadcrumb/miolo_with_breadcrumb.dart';
import 'package:repositories/repositories.dart';

/// Módulo de ativos de TI (lista, detalhes, etc.).
class ComputadorModule extends Module {
  @override
  List<Module> get imports => [NestedModule()];

  @override
  void binds(Injector i) {
    i
      ..addLazySingleton<ComputadorRepository>(ComputadorRepository.new)
      ..add<ComputadoresBloc>(ComputadoresBloc.new);
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
        '/:slug',
        child: (_) => const MioloWithBreadcrumb(
          title: 'Detalhes do ativo de TI',
          child: Center(
            child: Text('Detalhes do ativo de TI'),
          ),
        ),
      );
  }
}
