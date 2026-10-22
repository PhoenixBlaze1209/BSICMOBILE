import 'package:relay/features/organization/domain/organization_models.dart';
import 'package:timezone/timezone.dart' as tz;

final class BusinessCalendar {
  BusinessCalendar({
    required String timezone,
    required this.workingHours,
    required Set<String> holidayDates,
  }) : location = tz.getLocation(timezone),
       holidays = Set<String>.unmodifiable(holidayDates);

  final tz.Location location;
  final WorkingHours workingHours;
  final Set<String> holidays;

  DateTime addWorkingDuration(DateTime start, Duration duration) {
    if (duration <= Duration.zero) return start.toUtc();
    var cursor = tz.TZDateTime.from(start.toUtc(), location);
    var remaining = duration;
    while (remaining > Duration.zero) {
      final intervals = _intervalsFor(cursor);
      var advanced = false;
      for (final interval in intervals) {
        final from = _atMinute(cursor, interval.startMinute);
        final to = _atMinute(cursor, interval.endMinute);
        if (!to.isAfter(cursor)) continue;
        if (cursor.isBefore(from)) cursor = from;
        final available = to.difference(cursor);
        if (available >= remaining) return cursor.add(remaining).toUtc();
        remaining -= available;
        cursor = to;
        advanced = true;
      }
      cursor = tz.TZDateTime(
        location,
        cursor.year,
        cursor.month,
        cursor.day + 1,
      );
      if (!advanced) continue;
    }
    return cursor.toUtc();
  }

  Duration workingDurationBetween(DateTime start, DateTime end) {
    if (!end.isAfter(start)) return Duration.zero;
    var cursor = tz.TZDateTime.from(start.toUtc(), location);
    final stop = tz.TZDateTime.from(end.toUtc(), location);
    var total = Duration.zero;
    while (cursor.isBefore(stop)) {
      for (final interval in _intervalsFor(cursor)) {
        final from = _atMinute(cursor, interval.startMinute);
        final to = _atMinute(cursor, interval.endMinute);
        final segmentStart = cursor.isAfter(from) ? cursor : from;
        final segmentEnd = stop.isBefore(to) ? stop : to;
        if (segmentEnd.isAfter(segmentStart)) {
          total += segmentEnd.difference(segmentStart);
        }
      }
      cursor = tz.TZDateTime(
        location,
        cursor.year,
        cursor.month,
        cursor.day + 1,
      );
    }
    return total;
  }

  List<WorkingInterval> _intervalsFor(tz.TZDateTime day) {
    if (holidays.contains(_dateKey(day))) return const <WorkingInterval>[];
    final result = [...?workingHours.intervalsByWeekday[day.weekday]];
    result.sort((a, b) => a.startMinute.compareTo(b.startMinute));
    return result;
  }

  tz.TZDateTime _atMinute(tz.TZDateTime day, int minute) => tz.TZDateTime(
    location,
    day.year,
    day.month,
    day.day,
    minute ~/ 60,
    minute % 60,
  );

  String _dateKey(tz.TZDateTime value) =>
      '${value.year.toString().padLeft(4, '0')}-'
      '${value.month.toString().padLeft(2, '0')}-'
      '${value.day.toString().padLeft(2, '0')}';
}

final class SlaCalculator {
  const SlaCalculator(this.durations);

  final Map<String, Duration> durations;

  DateTime deadline({
    required String priority,
    required DateTime createdAt,
    required BusinessCalendar calendar,
  }) => calendar.addWorkingDuration(
    createdAt,
    durations[priority] ?? const Duration(hours: 24),
  );
}
