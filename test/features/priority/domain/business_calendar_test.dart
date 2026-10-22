import 'package:flutter_test/flutter_test.dart';
import 'package:relay/features/organization/domain/organization_models.dart';
import 'package:relay/features/priority/domain/business_calendar.dart';
import 'package:timezone/data/latest.dart' as tzdata;

void main() {
  setUpAll(tzdata.initializeTimeZones);
  final hours = WorkingHours(
    intervalsByWeekday: {
      for (var weekday = DateTime.monday; weekday <= DateTime.friday; weekday++)
        weekday: const [
          WorkingInterval(startMinute: 9 * 60, endMinute: 17 * 60),
        ],
    },
  );

  test('skips weekends and holidays', () {
    final calendar = BusinessCalendar(
      timezone: 'Asia/Manila',
      workingHours: hours,
      holidayDates: {'2026-10-26'},
    );
    final fridayAtFour = DateTime.utc(2026, 10, 23, 8);
    expect(
      calendar.addWorkingDuration(fridayAtFour, const Duration(hours: 2)),
      DateTime.utc(2026, 10, 27, 2),
    );
  });

  test('remains wall-clock safe across US DST transition', () {
    final calendar = BusinessCalendar(
      timezone: 'America/New_York',
      workingHours: hours,
      holidayDates: {},
    );
    final fridayAtFour = DateTime.utc(2026, 10, 30, 20);
    expect(
      calendar.addWorkingDuration(fridayAtFour, const Duration(hours: 2)),
      DateTime.utc(2026, 11, 2, 15),
    );
  });
}
