// ignore_for_file: prefer_const_constructors
import 'package:lotus_api_client/lotus_api_client.dart';
import 'package:repositories/repositories.dart';
import 'package:test/test.dart';

void main() {
  group('LotusRepository', () {
    test('can be instantiated', () {
      expect(
        ComputadorRepository(
          LotusApiClient(
            baseUrl: 'https://lotus-api.com',
            authToken: 'authToken',
            authTokenHeader: 'authTokenHeader',
            authTokenPrefix: 'authTokenPrefix',
          ),
        ),
        isNotNull,
      );
    });
  });
}
