import 'package:envied/envied.dart';

part 'env.g.dart';

/// {@template env}
/// The environment variables.
/// {@endtemplate}
@Envied(path: '.env')
abstract class Env {
  /// The base URL of the API.
  @EnviedField(varName: 'BASE_URL')
  static const String baseUrl = _Env.baseUrl;

  /// The authentication token.
  @EnviedField(varName: 'API_TOKEN', obfuscate: true)
  static String apiToken = _Env.apiToken;

  /// The authentication token header.
  @EnviedField(varName: 'API_TOKEN_HEADER')
  static const String apiTokenHeader = _Env.apiTokenHeader;

  /// The prefix of the authentication token.
  @EnviedField(varName: 'API_TOKEN_PREFIX')
  static const String apiTokenPrefix = _Env.apiTokenPrefix;
}
