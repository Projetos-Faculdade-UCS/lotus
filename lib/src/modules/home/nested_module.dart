import 'package:flutter_modular/flutter_modular.dart';
import 'package:lotus/src/env/env.dart';
import 'package:lotus/src/modules/home/controllers/menu_bar_controller.dart';
import 'package:lotus/src/modules/home/modules/computador/computador_module.dart';
import 'package:lotus/src/modules/home/modules/dashboard/dashboard_module.dart';
import 'package:lotus/src/modules/home/modules/impressora/impressora_module.dart';
import 'package:lotus/src/modules/home/modules/monitor_module/monitor_module.dart';
import 'package:lotus/src/modules/home/modules/settings/settings_module.dart';
import 'package:lotus/src/modules/home/pages/nested_page.dart';
import 'package:lotus/src/modules/home/widgets/sidebar.dart';
import 'package:lotus_api_client/lotus_api_client.dart';
import 'package:repositories/repositories.dart';
import 'package:sidebarx/sidebarx.dart';

/// The Home module of the application.
class NestedModule extends Module {
  @override
  void binds(Injector i) {
    i
      ..add<SidebarXController>(MySideBarController.new)
      ..addSingleton<MenuBarController>(MenuBarController.new)
      ..addLazySingleton<ComputadorRepository>(
        ComputadorRepository.new,
      );
  }

  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton<LotusApiClient>(
      () => LotusApiClient(
        authToken: Env.apiToken,
        authTokenHeader: Env.apiTokenHeader,
        authTokenPrefix: Env.apiTokenPrefix,
        baseUrl: Env.baseUrl,
      ),
    );
  }

  @override
  void routes(RouteManager r) {
    Modular.setInitialRoute('/dashboard/');
    r.child(
      '/',
      child: (_) => const NestedPage(),
      children: [
        ParallelRoute.module('/settings', module: SettingsModule()),
        ParallelRoute.module('/dashboard', module: DashboardModule()),
        ParallelRoute.module('/computadores', module: ComputadorModule()),
        ParallelRoute.module('/impressoras', module: ImpressoraModule()),
        ParallelRoute.module('/monitores', module: MonitorModule()),
      ],
      transition: TransitionType.fadeIn,
    );
  }
}
