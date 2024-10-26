// ignore_for_file: prefer_const_constructors
import 'package:lotus_api_client/lotus_api_client.dart';
import 'package:test/test.dart';

void main() {
  group('LotusApi', () {
    test('can be instantiated', () {
      expect(
        LotusApiClient(
          authToken: 'authToken',
          authTokenHeader: 'authTokenHeader',
          authTokenPrefix: 'authTokenPrefix',
          baseUrl: 'baseUrl',
        ),
        isNotNull,
      );
    });
  });
}
