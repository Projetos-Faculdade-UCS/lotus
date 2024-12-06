import 'package:lotus_api_client/lotus_api_client.dart';
import 'package:repositories/src/models/dashboard.dart';
import 'package:repositories/src/repository_exception.dart';

/// {@template dashboard_repository}
/// Repository which manages [Dashboard]s.
/// {@endtemplate}
class DashboardRepository {
  /// {@macro dashboard_repository}
  const DashboardRepository(this.lotusApiClient);

  /// The Lotus API client.
  final LotusApiClient lotusApiClient;

  /// Fetches the [Dashboard] data.
  Future<Dashboard> fetch() async {
    final response =
        await lotusApiClient.get<Map<String, dynamic>>('/dashboard');

    if (response.data == null || response.statusCode != 200) {
      throw RepositoryException('Failed to fetch dashboard');
    }

    final dashboardMap = response.data!;

    return Dashboard.fromJson(dashboardMap);
  }
}
