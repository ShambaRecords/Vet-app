import 'package:intl/intl.dart';

class Config{
  Config._();

  static String returnAnimalIcon(String animal){
    String url = "";
    switch (animal){
      case "dog":
        url = "dog-icon.png";
        break;
      case "cat":
        url = "cat-icon.png";
        break;
      case "cow":
        url = "cow-icon.png";
        break;
      case "pig":
        url = "pig-icon.png";
        break;
      default:
        url = "cat-icon.png";
        break;
    }
    return url;
  }

  static String validateDob(String value){
    if (value.isEmpty){
      return 'Please select valid dates';
    } else {
      return null;
    }
  }

  static String dateToString(DateTime date){
    return DateFormat('yyyy-MM-dd').format(date);
  }

  static String dateToStringWithTime(DateTime date){
    return DateFormat('dd MMMM yyyy').format(date) + " at " +DateFormat('HH:mm').format(date);
  }

  static String dateToTimeString(DateTime date){
    return DateFormat('HH:mm').format(date);
  }

  static DateTime stringToDate(String date){
    return DateTime.parse(date);
  }
}