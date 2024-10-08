import 'package:flutter_modular/flutter_modular.dart';
import 'package:lotus/src/modules/home/controllers/bottom_bar_controller.dart';
import 'package:lotus/src/modules/home/controllers/menu_bar_controller.dart';
import 'package:lotus/src/modules/home/modules/dashboard/dashboard_module.dart';
import 'package:lotus/src/modules/home/modules/ice_cream/ice_cream_module.dart';
import 'package:lotus/src/modules/home/modules/search/search_module.dart';
import 'package:lotus/src/modules/home/modules/settings/settings_module.dart';
import 'package:lotus/src/modules/home/modules/shop/shop_module.dart';
import 'package:lotus/src/modules/home/pages/nested_page.dart';
import 'package:lotus/src/modules/home/widgets/sidebar.dart';
import 'package:sidebarx/sidebarx.dart';

/// The Home module of the application.
class NestedModule extends Module {
  @override
  void binds(Injector i) {
    i
      ..add<SidebarXController>(MySideBarController.new)
      ..addLazySingleton<BottomBarController>(BottomBarController.new)
      ..addSingleton<MenuBarController>(MenuBarController.new);
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
        ParallelRoute.module('/shop', module: ShopModule()),
        ParallelRoute.module('/ice-cream', module: IceCreamModule()),
        ParallelRoute.module('/search', module: SearchModule()),
      ],
      transition: TransitionType.fadeIn,
    );
  }
}
