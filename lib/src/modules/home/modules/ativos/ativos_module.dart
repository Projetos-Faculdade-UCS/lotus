import 'package:ativos_ui/ativos_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lotus_ui/lotus_ui.dart';

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
