import 'package:flutter_test/flutter_test.dart';
import 'package:lotus_utils/lotus_utils.dart';
import 'package:timeago/timeago.dart' as timeago;

void main() {
  group('DatetimeExtension', () {
    test('timeAgo returns correct time ago string', () {
      final now = DateTime.now();
      final fiveMinutesAgo = now.subtract(const Duration(minutes: 5));
      final oneHourAgo = now.subtract(const Duration(hours: 1));
      final oneDayAgo = now.subtract(const Duration(days: 1));

      timeago.setLocaleMessages('pt', timeago.PtBrMessages());

      expect(fiveMinutesAgo.timeAgo, 'há 5 minutos');
      expect(oneHourAgo.timeAgo, 'há 1 hora');
      expect(oneDayAgo.timeAgo, 'há 1 dia');
    });
  });
}
