import 'package:flutter_modular/flutter_modular.dart';
import 'package:lotus/src/modules/home/nested_module.dart';

/// The main module of the application.
class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module('/', module: NestedModule());
  }
}
