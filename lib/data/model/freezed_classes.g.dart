// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'freezed_classes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Booking _$_$_BookingFromJson(Map<String, dynamic> json) {
  return _$_Booking(
    json['animal'] as String?,
    _dateTimeFromTimeStamp(json['datetime'] as Timestamp),
    json['species'] as String?,
    json['user'] as String?,
    json['visit_reason'] as String?,
  );
}

Map<String, dynamic> _$_$_BookingToJson(_$_Booking instance) =>
    <String, dynamic>{
      'animal': instance.animal,
      'datetime': instance.datetime?.toIso8601String(),
      'species': instance.species,
      'user': instance.user,
      'visit_reason': instance.visitReason,
    };

_$_Specialist _$_$_SpecialistFromJson(Map<String, dynamic> json) {
  return _$_Specialist(
    json['name'] as String,
  );
}

Map<String, dynamic> _$_$_SpecialistToJson(_$_Specialist instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

_$_Payment _$_$_PaymentFromJson(Map<String, dynamic> json) {
  return _$_Payment(
    (json['amount'] as num?)?.toDouble(),
    _dateTimeFromTimeStamp(json['datetime'] as Timestamp),
    json['user'] as String?,
    json['type'] as String?,
    json['service'] as String?,
  );
}

Map<String, dynamic> _$_$_PaymentToJson(_$_Payment instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'datetime': instance.datetime?.toIso8601String(),
      'user': instance.user,
      'type': instance.type,
      'service': instance.service,
    };
