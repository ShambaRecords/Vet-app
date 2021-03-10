import 'package:flutter/cupertino.dart';

class Payment{
  String paymentId, appointmentId, amountPaid, date;

  Payment({
    @required this.paymentId,
    @required this.appointmentId,
    @required this.amountPaid,
    @required this.date
  });
}