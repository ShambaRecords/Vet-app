import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_classes.freezed.dart';
part 'freezed_classes.g.dart';

@freezed
class Booking with _$Booking {
  const factory Booking(
    String? id,
    String? animal,
    @JsonKey(name: "datetime", fromJson: _dateTimeFromTimeStamp, toJson: _timeStampToDateTime)
        DateTime? datetime,
    String? species,
    String? user,
    bool? paid,
    @JsonKey(name: "visit_reason") String? visitReason,
  ) = _Booking;

  factory Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);
}

DateTime _dateTimeFromTimeStamp(Timestamp timestamp) => timestamp.toDate();
Timestamp _timeStampToDateTime(DateTime? date) => Timestamp.fromDate(date!);

@freezed
class Specialist with _$Specialist {
  const factory Specialist(
    String name,
  ) = _Specialist;

  factory Specialist.fromJson(Map<String, dynamic> json) =>
      _$SpecialistFromJson(json);
}

@freezed
class Payment with _$Payment {
  const factory Payment(
    double? amount,
    @JsonKey(name: "datetime", fromJson: _dateTimeFromTimeStamp, toJson: _timeStampToDateTime)
        DateTime? datetime,
    String? user,
    String? type,
    String? service,
  ) = _Payment;

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);
}
