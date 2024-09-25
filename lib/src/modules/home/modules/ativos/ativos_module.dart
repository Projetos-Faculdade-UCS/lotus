import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lotus/src/modules/home/modules/ativos/pages/ativos_page.dart';
import 'package:lotus/src/modules/home/widgets/miolo.dart';

/// Módulo de ativos de TI (lista, detalhes, etc.).
class AtivosModule extends Module {
  @override
  void routes(RouteManager r) {
    r
      ..child(
        '/',
        child: (_) => const AtivosPage(),
      )
      ..child(
        '/:slug',
        child: (_) => const Miolo(
          child: Center(
            child: Text('Detalhes do ativo de TI'),
          ),
        ),
      );
  }
}
