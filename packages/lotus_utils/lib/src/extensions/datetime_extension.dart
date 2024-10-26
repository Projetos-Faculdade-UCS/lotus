import 'package:timeago/timeago.dart' as timeago;

/// Extensão para a classe [DateTime].
extension DatetimeExtension on DateTime? {
  /// Retorna a data formatada como "Há x tempo".
  String get timeAgo {
    if (this == null) return '';
    return timeago.format(this!, locale: 'pt');
  }
}
