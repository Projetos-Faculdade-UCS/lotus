import 'package:dio/dio.dart';
import 'package:dio/io.dart';

/// {@template lotus_api_client}
/// The API Wrapper for Lotus.
/// {@endtemplate}
class LotusApiClient with DioMixin implements Dio {
  /// {@macro lotus_api_client}
  LotusApiClient({
    required this.authToken,
    required this.authTokenHeader,
    required this.authTokenPrefix,
    required this.baseUrl,
  }) {
    httpClientAdapter = IOHttpClientAdapter();
    options = BaseOptions(
      baseUrl: baseUrl,
      headers: <String, dynamic>{},
      contentType: Headers.jsonContentType,
    );
    options.headers[authTokenHeader] = '$authTokenPrefix $authToken';
  }

  /// The base URL of the API.
  final String baseUrl;

  /// The authentication token.
  final String authToken;

  /// The authentication token header.
  final String authTokenHeader;

  /// The prefix of the authentication token.
  final String authTokenPrefix;
}
