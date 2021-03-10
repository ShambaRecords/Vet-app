import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:vet_app/data/model/specialist.dart';
import 'package:vet_app/res/strings.dart';
import 'package:vet_app/screens/apppointment_page/widgets.dart';
import 'package:vet_app/util/di/injection.dart';
import 'package:vet_app/util/routing/navigation_service.dart';

class AppointmentPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: const Text("Schedule Appointment"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BookingCalendar(specialist: Specialist()),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Time"),
                )),
            Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {},
                    child: Text("09.00am - 10.00am"),
                    style: ButtonStyle(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: null,
                    child: Text("10.00am - 11.00am"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: null,
                    child: Text("11.00am - 12.00pm"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: null,
                    child: Text("12.00pm - 01.00pm"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: null,
                    child: Text("01.00pm - 02.00pm"),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () =>
                  getIt<NavigationService>().navigateTo(SUCCESS_PAGE_ROUTE),
              child: Text("Make Appointment"),
            )
          ],
        ),
      ),
    );
  }
}
