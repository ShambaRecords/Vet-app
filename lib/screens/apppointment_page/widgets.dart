import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:vet_app/domain/blocs/appointment_bloc.dart';
import 'package:vet_app/domain/providers/appointment/calendar_provider.dart';
import 'package:vet_app/domain/providers/appointment/time_provider.dart';
import 'package:vet_app/domain/providers/global/color_provider.dart';
import 'package:vet_app/model/freezed_classes.dart';
import 'package:vet_app/res/values.dart';
import 'package:vet_app/util/di/injection.dart';
import 'package:vet_app/util/ui/datetimeutil.dart';
import 'package:vet_app/util/ui/global_widgets.dart';

class BookingCalendar extends HookWidget {
  final Specialist specialist;

  BookingCalendar({required this.specialist});
  @override
  Widget build(BuildContext context) {
    final _colors = useProvider(colorProvider);
    final _selectedDay = useProvider(selectedDateStateProvider).state;

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
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            outsideDaysVisible: false,
            todayTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.white,
            ),
          ),
          selectedDayPredicate: (day) {
            return _selectedDay == day;
          },
          daysOfWeekHeight: 40,
          daysOfWeekStyle: DaysOfWeekStyle(
              decoration: BoxDecoration(),
              weekdayStyle:
                  TextStyle(color: _colors.appThemeAndroid.primaryColor),
              weekendStyle:
                  TextStyle(color: _colors.appThemeAndroid.primaryColorDark)),
          onDaySelected: (selectedDay, focusedDay) {
            context.read(selectedDateStateProvider).state = selectedDay;
            context.read(focusedDateStateProvider).state = focusedDay;
          },
          dayHitTestBehavior: HitTestBehavior.deferToChild,
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

class TimePage extends HookWidget {
  final bloc = getIt<AppointmentBloc>();
  @override
  Widget build(BuildContext context) {
    final _focusedDay = useProvider(focusedDateStateProvider).state;
    final selectedTime = useProvider(selectedTimesStateProvider).state;
    final theme = Theme.of(context);
    return Column(
      children: [
        BookingCalendar(specialist: Specialist("Random")),
        Padding(
          padding: const EdgeInsets.only(top: 30),
        ),
        Align(
          alignment: Alignment.center,
          child: Text("Time"),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
        ),
        Wrap(
          children: [
            for (var time in timeList) ...[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: checkTime(selectedTime, time)
                    ? TextButton(
                        onPressed: () {
                          context.read(selectedTimesStateProvider).state = time;
                          if (_focusedDay != null) {
                            bloc.changeDate(
                              DateTime(_focusedDay.year, _focusedDay.month,
                                  _focusedDay.day, time.hour, time.minute),
                            );
                          } else {
                            Fluttertoast.showToast(msg: "Please select a date");
                          }
                        },
                        child: Text(DateTimeUtils.getHour(time)),
                        style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: theme.accentColor))
                    : OutlinedButton(
                        onPressed: () {
                          context.read(selectedTimesStateProvider).state = time;
                        },
                        child: Text(DateTimeUtils.getHour(time)),
                      ),
              ),
            ]
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 80),
        ),
      ],
    );
  }
}

bool checkTime(DateTime selected, DateTime other) {
  return selected.hour == other.hour;
}

class PersonalDetailsPage extends HookWidget {
  late final bloc;

  PersonalDetailsPage(this.bloc);
  @override
  Widget build(BuildContext context) {
    final _focusedDay = useProvider(focusedDateStateProvider).state;
    final selectedTime = useProvider(selectedTimesStateProvider).state;

    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
              "Add your details for the ${DateTimeUtils.getDayMonthYear(_focusedDay!)} ${DateTimeUtils.getHour(selectedTime)} appointment"),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: Column(
              children: [
                StreamBuilder<Object>(
                  stream: bloc.animal,
                  builder: (context, snapshot) {
                    return formField(
                      context,
                      "Animal e.g Dog, Cat, etc",
                      true,
                      onChanged: bloc.changeAnimal,
                      error: snapshot.error != null
                          ? snapshot.error.toString()
                          : null,
                    );
                  },
                ),
                StreamBuilder<String>(
                  stream: bloc.species,
                  builder: (context, snapshot) {
                    return formField(
                      context,
                      "Animal Species e.g German Sheperd, Rottweiler",
                      true,
                      onChanged: bloc.changeSpecies,
                      error: snapshot.error != null
                          ? snapshot.error.toString()
                          : null,
                    );
                  },
                ),
                StreamBuilder<String>(
                  stream: bloc.user,
                  builder: (context, snapshot) {
                    return formField(
                      context,
                      "Your Name",
                      true,
                      onChanged: bloc.changeUser,
                      error: snapshot.error != null
                          ? snapshot.error.toString()
                          : null,
                    );
                  },
                ),
                StreamBuilder<String>(
                  stream: bloc.reason,
                  builder: (context, snapshot) {
                    return DropdownButton<String>(
                      isExpanded: true,
                      items: [
                        for (var service in servicesMap.keys) ...[
                          DropdownMenuItem(
                            child: Text(service),
                            value: service,
                          ),
                        ],
                      ],
                      onChanged: (value) {
                        bloc.changeReason(value!);
                      },
                      hint: snapshot.data != null
                          ? Text(snapshot.data!)
                          : Text('Visit Reason'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 80.0),
        )
      ],
    );
  }
}
