import 'package:intl/intl.dart';

const Map<String, double> servicesMap = {
  "Preventive Medicine": 5000,
  "Surgery": 15000,
  "Euthanasia": 2000,
  "Vaccination": 1500,
  "Check up": 2000,
  "Other": 3000
};
List<DateTime> timeList = [
  DateFormat('hh.mma').parse("09.00AM"),
  DateFormat('hh.mma').parse("10.00AM"),
  DateFormat('hh.mma').parse("11.00AM"),
  DateFormat('hh.mma').parse("12.00PM"),
  DateFormat('hh.mma').parse("01.00PM"),
  DateFormat('hh.mma').parse("02.00PM"),
  DateFormat('hh.mma').parse("03.00PM"),
  DateFormat('hh.mma').parse("04.00PM"),
];
