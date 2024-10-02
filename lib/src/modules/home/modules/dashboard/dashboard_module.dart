import 'package:flutter_modular/flutter_modular.dart';
import 'package:lotus/src/env/env.dart';
import 'package:lotus/src/modules/home/modules/dashboard/pages/dashboard_page.dart';
import 'package:lotus_api_client/lotus_api_client.dart';

/// The Dashboard module of the application.
class DashboardModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<LotusApiClient>(
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
    r.child(
      '/',
      child: (_) => const DashboardPage(),
    );
  }
}
