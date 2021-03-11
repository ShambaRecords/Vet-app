import 'package:intl/intl.dart';

class DateTimeUtils {

  /// MMM
  static String getMonth(DateTime dateTime) {
    var formatter = DateFormat('MMM');
    return formatter.format(dateTime.toLocal());
  }

  /// dd-MM-yyyy
  // ignore: non_constant_identifier_names
  static String getdd_MM_yyyy(DateTime dateTime) {
    var formatter = DateFormat('dd-MM-yyyy');
    return formatter.format(dateTime.toLocal());
  }

  /// dd
  static String getDayOfMonth(DateTime dateTime) {
    var formatter = DateFormat('dd');
    return formatter.format(dateTime.toLocal());
  }

  /// EEEE dd MMM, yyyy
  static String getFullDate(DateTime dateTime) {
    var formatter = DateFormat('EEEE dd MMM, yyyy');
    return formatter.format(dateTime.toLocal());
  }

  /// yyyy-MM-dd HH:mm:ss.SSS
  static String getFullDateTime(DateTime dateTime) {
    var formatter = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    return formatter.format(dateTime.toLocal());
  }

    /// yyyy MM dd HH:mm:ss.SSS
  static String getFullDateTime2(DateTime dateTime) {
    var formatter = DateFormat('yyyy MM dd HH:mm:ss.SSS');
    return formatter.format(dateTime.toLocal());
  }


  /// dd MMM
  static String getDayMonth(DateTime dateTime) {
    var formatter = DateFormat('dd MMM');
    return formatter.format(dateTime.toLocal());
  }

  /// dd MMM, yyyy
  static String getDayMonthYear(DateTime dateTime) {
    var formatter = DateFormat('dd MMM, yyyy');
    return formatter.format(dateTime.toLocal());
  }

  /// EEEE
  static String getDayOfWeek(DateTime dateTime) {
    var formatter = DateFormat('EEEE');
    return formatter.format(dateTime);
  }

  /// DD
  static String getDayWeek(DateTime dateTime) {
    var formatter = DateFormat('DD');
    return formatter.format(dateTime);
  }
}