import 'package:flutter_modular/flutter_modular.dart';
import 'package:lotus/src/modules/home/modules/monitor_module/bloc/monitores_bloc.dart';
import 'package:lotus/src/modules/home/modules/monitor_module/pages/monitor_page.dart';
import 'package:lotus/src/modules/home/modules/monitor_module/pages/monitores_page.dart';
import 'package:lotus/src/modules/home/nested_module.dart';
import 'package:repositories/repositories.dart';

/// The Search module of the application.
class MonitorModule extends Module {
  @override
  List<Module> get imports => [NestedModule()];

  @override
  void binds(Injector i) {
    i
      ..addLazySingleton<MonitorRepository>(MonitorRepository.new)
      ..add<MonitoresBloc>(MonitoresBloc.new);
  }

  @override
  void routes(RouteManager r) {
    r
      ..child(
        '/',
        child: (_) => MonitoresPage(monitoresBloc: Modular.get()),
      )
      ..child(
        '/:id',
        child: (_) => MonitorPage(
          id: int.parse(r.args.params['id'] as String),
        ),
      );
  }
}
