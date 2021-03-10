import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:vet_app/data/model/specialist.dart';
import 'package:vet_app/domain/providers/global/color_provider.dart';
import 'package:vet_app/res/styles.dart';

class BookingCalendar extends HookWidget {
  final Specialist specialist;

  BookingCalendar({required this.specialist});
  @override
  Widget build(BuildContext context) {
    final _colors = useProvider(colorProvider);
    return Material(
      color: _colors.appThemeAndroid.scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TableCalendar(
          calendarFormat: CalendarFormat.month,
          calendarStyle: CalendarStyle(
            canMarkersOverflow: true,
            isTodayHighlighted: true,
            selectedDecoration: const BoxDecoration(
                color: primaryColor, shape: BoxShape.circle),
            outsideDaysVisible: false,
            todayTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Colors.white),
          ),
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            formatButtonDecoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(20.0),
            ),
            formatButtonTextStyle: TextStyle(color: Colors.white),
            formatButtonShowsNext: false,
          ),
          startingDayOfWeek: StartingDayOfWeek.monday,
          availableGestures: AvailableGestures.horizontalSwipe,
          firstDay: DateTime.utc(2020, 10, 16),
          lastDay: DateTime.utc(2025, 3, 14),
          focusedDay: DateTime.now(),
        ),
      ),
    );
  }
}
