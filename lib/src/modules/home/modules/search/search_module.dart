import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lotus_ui/lotus_ui.dart';

/// The Search module of the application.
class SearchModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => const Miolo(
        child: Center(
          child: Text('Search'),
        ),
      ),
    );
  }
}
