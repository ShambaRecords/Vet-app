import 'dart:async';
import 'package:mvvm/mvvm.dart';

class AppointmentsViewModel extends ViewModel {
  AppointmentsViewModel() {
    propertyValue<String>(#time, initial: "");
    start();
  }

  start() {
    Timer.periodic(const Duration(seconds: 1), (_) {
      var now = DateTime.now();
      setValue<String>(#time, "${now.hour}:${now.minute}:${now.second}");
    });
  }
}