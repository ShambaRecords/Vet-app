import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:vet_app/domain/blocs/appointment_bloc.dart';
import 'package:vet_app/domain/providers/appointment/appointment_page_provider.dart';
import 'package:vet_app/domain/providers/appointment/calendar_provider.dart';
import 'package:vet_app/domain/providers/appointment/time_provider.dart';
import 'package:vet_app/domain/repository/bookings_repository.dart';
import 'package:vet_app/model/freezed_classes.dart';
import 'package:vet_app/res/strings.dart';
import 'package:vet_app/screens/apppointment_page/widgets.dart';
import 'package:vet_app/util/di/injection.dart';
import 'package:vet_app/util/routing/navigation_service.dart';

class AppointmentPage extends HookWidget {
  final bloc = getIt<AppointmentBloc>();

  @override
  Widget build(BuildContext context) {
    final _focusedDay = useProvider(focusedDateStateProvider).state;
    final selectedTime = useProvider(selectedTimesStateProvider).state;
    final loaderState = useProvider(loaderStateProvider).state;
    final page = useProvider(appointmentPageStateProvider).state;

    return WillPopScope(
      onWillPop: () {
        if (page == 1) {
          context.read(appointmentPageStateProvider).state = 0;
          return Future.value(false);
        }

        context.read(appointmentPageStateProvider).state = 0;
        return Future.value(true);
      },
      child: PlatformScaffold(
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
                    page == 0 ? TimePage() : PersonalDetailsPage(bloc)
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0, right: 20.0),
                child: StreamBuilder<bool>(
                  stream: bloc.inputValid,
                  builder: (context, snapshot) {
                    return loaderState
                        ? Center(
                            child: Container(
                              height: 50,
                              width: 50,
                              child: PlatformCircularProgressIndicator(),
                            ),
                          )
                        : ElevatedButton(
                            onPressed: page == 1
                                ? snapshot.hasData && snapshot.data == true
                                    ? () async {
                                        if (_focusedDay == null) {
                                          Fluttertoast.showToast(
                                              msg:
                                                  "Please select an appointment date first");
                                          return;
                                        }
                                        context
                                            .read(loaderStateProvider)
                                            .state = true;
                                        String? animal =
                                            await bloc.animal.first;
                                        String? species =
                                            await bloc.species.first;
                                        String? user = await bloc.user.first;
                                        String? visitReason =
                                            await bloc.reason.first;

                                        var newBooking = Booking(
                                            null,
                                            animal,
                                            DateTime(
                                                _focusedDay.year,
                                                _focusedDay.month,
                                                _focusedDay.day,
                                                selectedTime.hour,
                                                selectedTime.minute),
                                            species,
                                            user,
                                            false,
                                            visitReason);
                                        await getIt<BookingsRepository>()
                                            .addBooking(newBooking);
                                        context
                                            .read(loaderStateProvider)
                                            .state = false;
                                        getIt<NavigationService>()
                                            .navigateToAndPopBackStack(
                                                SUCCESS_PAGE_ROUTE);
                                        context
                                            .read(appointmentPageStateProvider)
                                            .state = 0;
                                      }
                                    : () {
                                        Fluttertoast.showToast(
                                            msg:
                                                "Please complete filling your details form");
                                      }
                                : () {
                                    context
                                        .read(appointmentPageStateProvider)
                                        .state = 1;
                                  },
                            child: page == 0
                                ? Text("Continue")
                                : Text("Make Appointment"),
                          );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
