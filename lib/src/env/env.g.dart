// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env.dart';

// **************************************************************************
// EnviedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _Env {
  static const String baseUrl = 'https://my.api.mockaroo.com/';

  static const List<int> _enviedkeyapiToken = <int>[
    868083861,
    3521771497,
    1648176809,
    1881691620,
    2385660489,
    3242395530,
    1724227820,
    3679150638,
  ];

  static const List<int> _envieddataapiToken = <int>[
    868083956,
    3521771484,
    1648176792,
    1881691605,
    2385660528,
    3242395624,
    1724227807,
    3679150622,
  ];

  static final String apiToken = String.fromCharCodes(List<int>.generate(
    _envieddataapiToken.length,
    (int i) => i,
    growable: false,
  ).map((int i) => _envieddataapiToken[i] ^ _enviedkeyapiToken[i]));

  static const String apiTokenHeader = 'X-API-Key';

  static const String apiTokenPrefix = '';
}
