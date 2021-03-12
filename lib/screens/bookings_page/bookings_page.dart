import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vet_app/domain/providers/home/bookings_provider.dart';
import 'package:vet_app/domain/repository/bookings_repository.dart';
import 'package:vet_app/model/freezed_classes.dart';
import 'package:vet_app/util/di/injection.dart';
import 'package:vet_app/util/ui/datetimeutil.dart';

class BookingsPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bookings = useProvider(bookingsStreamProvider);
    return PlatformScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Your Bookings"),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                  height: size.height,
                  width: size.width,
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, top: 8.0, bottom: 150),
                  child: bookings.when(data: (QuerySnapshot data) {
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

                    return ListView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        for (var booking in currentBookings) ...[
                          Column(
                            children: [
                              ListTile(
                                title: Text(
                                  DateTimeUtils.getDayOfWeek(
                                    booking.datetime!,
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                    Text("Animal: ${booking.animal}"),
                                    Text("Species: ${booking.species}"),
                                    Row(
                                      children: [
                                        Text("Paid: "),
                                        booking.paid ?? false
                                            ? Text(
                                                "YES",
                                                style: TextStyle(
                                                    color: Colors.green),
                                              )
                                            : Text(
                                                'NO',
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                      ],
                                    ),
                                    Text(booking.visitReason!),
                                  ],
                                ),
                                leading: Icon(Icons.calendar_today_outlined),
                                trailing: GestureDetector(
                                  onTap: () {
                                    getIt<BookingsRepository>()
                                        .deleteBooking(booking.id!);
                                  },
                                  child: Icon(
                                    Icons.delete,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16),
                              )
                            ],
                          ),
                        ]
                      ],
                    );
                  }, loading: () {
                    return Center(child: PlatformCircularProgressIndicator());
                  }, error: (error, stack) {
                    return Text(
                        "An error ocurred while loading your bookings.");
                  })),
            ),
          ),
        ],
      ),
    );
  }
}
