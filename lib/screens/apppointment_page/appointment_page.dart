import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:vet_app/data/model/freezed_classes.dart';
import 'package:vet_app/domain/blocs/appointment_bloc.dart';
import 'package:vet_app/domain/providers/appointment/calendar_provider.dart';
import 'package:vet_app/domain/providers/appointment/time_provider.dart';
import 'package:vet_app/domain/repository/bookings_repository.dart';
import 'package:vet_app/res/strings.dart';
import 'package:vet_app/res/values.dart';
import 'package:vet_app/screens/apppointment_page/widgets.dart';
import 'package:vet_app/util/di/injection.dart';
import 'package:vet_app/util/routing/navigation_service.dart';
import 'package:vet_app/util/ui/datetimeutil.dart';
import 'package:vet_app/util/ui/global_widgets.dart';

class AppointmentPage extends HookWidget {
  final bloc = getIt<AppointmentBloc>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final _focusedDay = useProvider(focusedDateStateProvider).state;
    final selectedTime = useProvider(selectedTimesStateProvider).state;
    final loaderState = useProvider(loaderStateProvider).state;

    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: const Text("Schedule Appointment"),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                                    context
                                        .read(selectedTimesStateProvider)
                                        .state = time;
                                    if (_focusedDay != null) {
                                      bloc.changeDate(
                                        DateTime(
                                            _focusedDay.year,
                                            _focusedDay.month,
                                            _focusedDay.day,
                                            time.hour,
                                            time.minute),
                                      );
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: "Please select a date");
                                    }
                                  },
                                  child: Text(DateTimeUtils.getHour(time)),
                                  style: TextButton.styleFrom(
                                      primary: Colors.white,
                                      backgroundColor: theme.accentColor))
                              : OutlinedButton(
                                  onPressed: () {
                                    context
                                        .read(selectedTimesStateProvider)
                                        .state = time;
                                  },
                                  child: Text(DateTimeUtils.getHour(time)),
                                ),
                        ),
                      ]
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text("Appointment Details"),
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
                                  for (var service in servicesList) ...[
                                    DropdownMenuItem(
                                      child: Text(service),
                                      value: service,
                                    ),
                                  ],
                                ],
                                onChanged: (value) {
                                  print("value is $value");
                                  bloc.changeReason(value!);
                                },
                                hint: Text(snapshot.data!),
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
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: StreamBuilder<Object>(
                  stream: bloc.inputValid,
                  builder: (context, snapshot) {
                    return ElevatedButton(
                      onPressed: snapshot.hasData && snapshot.data == true
                          ? _focusedDay != null
                              ? () async {
                                  context.read(loaderStateProvider).state =
                                      true;
                                  String? animal = await bloc.animal.first;
                                  String? species = await bloc.species.first;
                                  String? user = await bloc.user.first;
                                  String? visitReason = await bloc.reason.first;

                                  var newBooking = Booking(
                                      animal,
                                      DateTime(
                                          _focusedDay.year,
                                          _focusedDay.month,
                                          _focusedDay.day,
                                          selectedTime.hour,
                                          selectedTime.minute),
                                      species,
                                      user,
                                      visitReason);
                                  getIt<BookingsRepository>()
                                      .addBooking(newBooking);
                                  context.read(loaderStateProvider).state =
                                      false;
                                  getIt<NavigationService>()
                                      .navigateTo(SUCCESS_PAGE_ROUTE);
                                }
                              : () {
                                  Fluttertoast.showToast(
                                      msg:
                                          "Please select an appointment date first");
                                }
                          : () {
                              Fluttertoast.showToast(
                                  msg:
                                      "Please complete filling your details form");
                            },
                      child: loaderState
                          ? Center(
                              child: PlatformCircularProgressIndicator(),
                            )
                          : Text("Make Appointment"),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}

bool checkTime(DateTime selected, DateTime other) {
  return selected.hour == other.hour;
}
