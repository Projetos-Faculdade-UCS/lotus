import 'package:flutter_modular/flutter_modular.dart';
import 'package:lotus/src/modules/home/modules/dashboard/bloc/dashboard_bloc.dart';
import 'package:lotus/src/modules/home/modules/dashboard/pages/dashboard_page.dart';
import 'package:lotus/src/modules/home/nested_module.dart';
import 'package:repositories/repositories.dart';

/// The Dashboard module of the application.
class DashboardModule extends Module {
  @override
  List<Module> get imports => [NestedModule()];

  @override
  void binds(Injector i) {
    i
      ..addLazySingleton<DashboardBloc>(DashboardBloc.new)
      ..addLazySingleton<DashboardRepository>(DashboardRepository.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => DashboardPage(
        bloc: Modular.get<DashboardBloc>(),
      ),
    );
  }
}
