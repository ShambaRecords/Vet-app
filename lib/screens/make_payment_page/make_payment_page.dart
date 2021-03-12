import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vet_app/data/model/freezed_classes.dart';
import 'package:vet_app/domain/providers/appointment/time_provider.dart';
import 'package:vet_app/domain/providers/home/bookings_provider.dart';
import 'package:vet_app/domain/providers/make_payment/make_payments_provider.dart';
import 'package:vet_app/domain/repository/bookings_repository.dart';
import 'package:vet_app/domain/repository/payments_repository.dart';
import 'package:vet_app/res/strings.dart';
import 'package:vet_app/res/values.dart';
import 'package:vet_app/util/di/injection.dart';
import 'package:vet_app/util/routing/navigation_service.dart';
import 'package:vet_app/util/ui/datetimeutil.dart';

class MakePaymentPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bookings = useProvider(
      bookingsStreamProvider,
    );
    final loaderState = useProvider(loaderStateProvider).state;
    final selectedBooking = useProvider(selectedBookingProvider).state;

    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: const Text("Make Payment"),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
                height: size.height,
                width: size.width,
                padding: const EdgeInsets.all(8.0),
                child: bookings.when(
                    data: (QuerySnapshot data) {
                      if (data.docs.isEmpty) {
                        return Text("No bookings available");
                      }

                      List<Booking> currentBookings = [];
                      for (var document in data.docs) {
                        Booking booking = Booking.fromJson(document.data()!);
                        Booking newBooking = Booking(
                            document.id,
                            booking.animal,
                            booking.datetime,
                            booking.species,
                            booking.user,
                            booking.paid,
                            booking.visitReason);
                        currentBookings.add(newBooking);
                      }

                      if (currentBookings
                          .where((element) => element.paid == false)
                          .isEmpty) {
                        return Text("You have no bookings made.");
                      }

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView(
                          children: [
                            for (var booking in currentBookings
                                .where((element) => element.paid == false)) ...[
                              Column(
                                children: [
                                  RadioListTile(
                                    groupValue: selectedBooking,
                                    onChanged: (Booking? value) {
                                      context
                                          .read(selectedBookingProvider)
                                          .state = value;
                                    },
                                    value: booking,
                                    title: Text(
                                      DateTimeUtils.getDayOfWeek(
                                        booking.datetime!,
                                      ),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          DateTimeUtils.getDayMonthYear(
                                            booking.datetime!,
                                          ),
                                        ),
                                        Text(
                                          DateTimeUtils.getTime(
                                            booking.datetime!,
                                          ),
                                        ),
                                        Text(
                                          booking.user!,
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor),
                                        ),
                                        Text("Animal: ${booking.animal}"),
                                        Text("Species: ${booking.species}"),
                                        Text(booking.visitReason!),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16),
                                  )
                                ],
                              ),
                            ]
                          ],
                        ),
                      );
                    },
                    loading: () {
                      return Center(child: PlatformCircularProgressIndicator());
                    },
                    error: (error, stack) {})),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: ElevatedButton(
                onPressed: () async {
                  context.read(loaderStateProvider).state = true;

                  if (selectedBooking == null) {
                    Fluttertoast.showToast(
                        msg: "Please select an appointment to pay for");
                    context.read(loaderStateProvider).state = false;
                    return;
                  }

                  var newPayment = Payment(
                      servicesMap[selectedBooking.visitReason],
                      DateTime.now(),
                      selectedBooking.user,
                      "M-pesa",
                      selectedBooking.visitReason);
                  await getIt<PaymentsRepository>().addPayment(newPayment);
                  await getIt<BookingsRepository>()
                      .updatePaymentState(selectedBooking.id!, {"paid": true});
                  context.read(loaderStateProvider).state = false;
                  Fluttertoast.showToast(msg: "Payment Successful");
                  getIt<NavigationService>().navigateTo(HOME_ROUTE);
                },
                child: loaderState
                    ? Center(
                        child: Container(
                          height: 100,
                          width: 100,
                        child: PlatformCircularProgressIndicator(),
                      ))
                    : Text("Make Payment"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
