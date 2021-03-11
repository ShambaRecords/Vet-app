// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'freezed_classes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Booking _$BookingFromJson(Map<String, dynamic> json) {
  return _Booking.fromJson(json);
}

/// @nodoc
class _$BookingTearOff {
  const _$BookingTearOff();

  _Booking call(
      String? animal,
      @JsonKey(name: "datetime", fromJson: _dateTimeFromTimeStamp, toJson: _timeStampToDateTime)
          DateTime? datetime,
      String? species,
      String? user,
      @JsonKey(name: "visit_reason")
          String? visitReason) {
    return _Booking(
      animal,
      datetime,
      species,
      user,
      visitReason,
    );
  }

  Booking fromJson(Map<String, Object> json) {
    return Booking.fromJson(json);
  }
}

/// @nodoc
const $Booking = _$BookingTearOff();

/// @nodoc
mixin _$Booking {
  String? get animal => throw _privateConstructorUsedError;
  @JsonKey(
      name: "datetime",
      fromJson: _dateTimeFromTimeStamp,
      toJson: _timeStampToDateTime)
  DateTime? get datetime => throw _privateConstructorUsedError;
  String? get species => throw _privateConstructorUsedError;
  String? get user => throw _privateConstructorUsedError;
  @JsonKey(name: "visit_reason")
  String? get visitReason => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookingCopyWith<Booking> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingCopyWith<$Res> {
  factory $BookingCopyWith(Booking value, $Res Function(Booking) then) =
      _$BookingCopyWithImpl<$Res>;
  $Res call(
      {String? animal,
      @JsonKey(name: "datetime", fromJson: _dateTimeFromTimeStamp, toJson: _timeStampToDateTime)
          DateTime? datetime,
      String? species,
      String? user,
      @JsonKey(name: "visit_reason")
          String? visitReason});
}

/// @nodoc
class _$BookingCopyWithImpl<$Res> implements $BookingCopyWith<$Res> {
  _$BookingCopyWithImpl(this._value, this._then);

  final Booking _value;
  // ignore: unused_field
  final $Res Function(Booking) _then;

  @override
  $Res call({
    Object? animal = freezed,
    Object? datetime = freezed,
    Object? species = freezed,
    Object? user = freezed,
    Object? visitReason = freezed,
  }) {
    return _then(_value.copyWith(
      animal: animal == freezed
          ? _value.animal
          : animal // ignore: cast_nullable_to_non_nullable
              as String?,
      datetime: datetime == freezed
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      species: species == freezed
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String?,
      visitReason: visitReason == freezed
          ? _value.visitReason
          : visitReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$BookingCopyWith<$Res> implements $BookingCopyWith<$Res> {
  factory _$BookingCopyWith(_Booking value, $Res Function(_Booking) then) =
      __$BookingCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? animal,
      @JsonKey(name: "datetime", fromJson: _dateTimeFromTimeStamp, toJson: _timeStampToDateTime)
          DateTime? datetime,
      String? species,
      String? user,
      @JsonKey(name: "visit_reason")
          String? visitReason});
}

/// @nodoc
class __$BookingCopyWithImpl<$Res> extends _$BookingCopyWithImpl<$Res>
    implements _$BookingCopyWith<$Res> {
  __$BookingCopyWithImpl(_Booking _value, $Res Function(_Booking) _then)
      : super(_value, (v) => _then(v as _Booking));

  @override
  _Booking get _value => super._value as _Booking;

  @override
  $Res call({
    Object? animal = freezed,
    Object? datetime = freezed,
    Object? species = freezed,
    Object? user = freezed,
    Object? visitReason = freezed,
  }) {
    return _then(_Booking(
      animal == freezed
          ? _value.animal
          : animal // ignore: cast_nullable_to_non_nullable
              as String?,
      datetime == freezed
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      species == freezed
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as String?,
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String?,
      visitReason == freezed
          ? _value.visitReason
          : visitReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Booking with DiagnosticableTreeMixin implements _Booking {
  const _$_Booking(
      this.animal,
      @JsonKey(name: "datetime", fromJson: _dateTimeFromTimeStamp, toJson: _timeStampToDateTime)
          this.datetime,
      this.species,
      this.user,
      @JsonKey(name: "visit_reason")
          this.visitReason);

  factory _$_Booking.fromJson(Map<String, dynamic> json) =>
      _$_$_BookingFromJson(json);

  @override
  final String? animal;
  @override
  @JsonKey(
      name: "datetime",
      fromJson: _dateTimeFromTimeStamp,
      toJson: _timeStampToDateTime)
  final DateTime? datetime;
  @override
  final String? species;
  @override
  final String? user;
  @override
  @JsonKey(name: "visit_reason")
  final String? visitReason;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Booking(animal: $animal, datetime: $datetime, species: $species, user: $user, visitReason: $visitReason)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Booking'))
      ..add(DiagnosticsProperty('animal', animal))
      ..add(DiagnosticsProperty('datetime', datetime))
      ..add(DiagnosticsProperty('species', species))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('visitReason', visitReason));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Booking &&
            (identical(other.animal, animal) ||
                const DeepCollectionEquality().equals(other.animal, animal)) &&
            (identical(other.datetime, datetime) ||
                const DeepCollectionEquality()
                    .equals(other.datetime, datetime)) &&
            (identical(other.species, species) ||
                const DeepCollectionEquality()
                    .equals(other.species, species)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.visitReason, visitReason) ||
                const DeepCollectionEquality()
                    .equals(other.visitReason, visitReason)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(animal) ^
      const DeepCollectionEquality().hash(datetime) ^
      const DeepCollectionEquality().hash(species) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(visitReason);

  @JsonKey(ignore: true)
  @override
  _$BookingCopyWith<_Booking> get copyWith =>
      __$BookingCopyWithImpl<_Booking>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BookingToJson(this);
  }
}

abstract class _Booking implements Booking {
  const factory _Booking(
      String? animal,
      @JsonKey(name: "datetime", fromJson: _dateTimeFromTimeStamp, toJson: _timeStampToDateTime)
          DateTime? datetime,
      String? species,
      String? user,
      @JsonKey(name: "visit_reason")
          String? visitReason) = _$_Booking;

  factory _Booking.fromJson(Map<String, dynamic> json) = _$_Booking.fromJson;

  @override
  String? get animal => throw _privateConstructorUsedError;
  @override
  @JsonKey(
      name: "datetime",
      fromJson: _dateTimeFromTimeStamp,
      toJson: _timeStampToDateTime)
  DateTime? get datetime => throw _privateConstructorUsedError;
  @override
  String? get species => throw _privateConstructorUsedError;
  @override
  String? get user => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "visit_reason")
  String? get visitReason => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BookingCopyWith<_Booking> get copyWith =>
      throw _privateConstructorUsedError;
}

Specialist _$SpecialistFromJson(Map<String, dynamic> json) {
  return _Specialist.fromJson(json);
}

/// @nodoc
class _$SpecialistTearOff {
  const _$SpecialistTearOff();

  _Specialist call(String name) {
    return _Specialist(
      name,
    );
  }

  Specialist fromJson(Map<String, Object> json) {
    return Specialist.fromJson(json);
  }
}

/// @nodoc
const $Specialist = _$SpecialistTearOff();

/// @nodoc
mixin _$Specialist {
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpecialistCopyWith<Specialist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecialistCopyWith<$Res> {
  factory $SpecialistCopyWith(
          Specialist value, $Res Function(Specialist) then) =
      _$SpecialistCopyWithImpl<$Res>;
  $Res call({String name});
}

/// @nodoc
class _$SpecialistCopyWithImpl<$Res> implements $SpecialistCopyWith<$Res> {
  _$SpecialistCopyWithImpl(this._value, this._then);

  final Specialist _value;
  // ignore: unused_field
  final $Res Function(Specialist) _then;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SpecialistCopyWith<$Res> implements $SpecialistCopyWith<$Res> {
  factory _$SpecialistCopyWith(
          _Specialist value, $Res Function(_Specialist) then) =
      __$SpecialistCopyWithImpl<$Res>;
  @override
  $Res call({String name});
}

/// @nodoc
class __$SpecialistCopyWithImpl<$Res> extends _$SpecialistCopyWithImpl<$Res>
    implements _$SpecialistCopyWith<$Res> {
  __$SpecialistCopyWithImpl(
      _Specialist _value, $Res Function(_Specialist) _then)
      : super(_value, (v) => _then(v as _Specialist));

  @override
  _Specialist get _value => super._value as _Specialist;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_Specialist(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Specialist with DiagnosticableTreeMixin implements _Specialist {
  const _$_Specialist(this.name);

  factory _$_Specialist.fromJson(Map<String, dynamic> json) =>
      _$_$_SpecialistFromJson(json);

  @override
  final String name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Specialist(name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Specialist'))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Specialist &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(name);

  @JsonKey(ignore: true)
  @override
  _$SpecialistCopyWith<_Specialist> get copyWith =>
      __$SpecialistCopyWithImpl<_Specialist>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SpecialistToJson(this);
  }
}

abstract class _Specialist implements Specialist {
  const factory _Specialist(String name) = _$_Specialist;

  factory _Specialist.fromJson(Map<String, dynamic> json) =
      _$_Specialist.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SpecialistCopyWith<_Specialist> get copyWith =>
      throw _privateConstructorUsedError;
}

Payment _$PaymentFromJson(Map<String, dynamic> json) {
  return _Payment.fromJson(json);
}

/// @nodoc
class _$PaymentTearOff {
  const _$PaymentTearOff();

  _Payment call(
      double? amount,
      @JsonKey(name: "datetime", fromJson: _dateTimeFromTimeStamp, toJson: _timeStampToDateTime)
          DateTime? datetime,
      String? user,
      String? type,
      String? service) {
    return _Payment(
      amount,
      datetime,
      user,
      type,
      service,
    );
  }

  Payment fromJson(Map<String, Object> json) {
    return Payment.fromJson(json);
  }
}

/// @nodoc
const $Payment = _$PaymentTearOff();

/// @nodoc
mixin _$Payment {
  double? get amount => throw _privateConstructorUsedError;
  @JsonKey(
      name: "datetime",
      fromJson: _dateTimeFromTimeStamp,
      toJson: _timeStampToDateTime)
  DateTime? get datetime => throw _privateConstructorUsedError;
  String? get user => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get service => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentCopyWith<Payment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentCopyWith<$Res> {
  factory $PaymentCopyWith(Payment value, $Res Function(Payment) then) =
      _$PaymentCopyWithImpl<$Res>;
  $Res call(
      {double? amount,
      @JsonKey(name: "datetime", fromJson: _dateTimeFromTimeStamp, toJson: _timeStampToDateTime)
          DateTime? datetime,
      String? user,
      String? type,
      String? service});
}

/// @nodoc
class _$PaymentCopyWithImpl<$Res> implements $PaymentCopyWith<$Res> {
  _$PaymentCopyWithImpl(this._value, this._then);

  final Payment _value;
  // ignore: unused_field
  final $Res Function(Payment) _then;

  @override
  $Res call({
    Object? amount = freezed,
    Object? datetime = freezed,
    Object? user = freezed,
    Object? type = freezed,
    Object? service = freezed,
  }) {
    return _then(_value.copyWith(
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      datetime: datetime == freezed
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      service: service == freezed
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PaymentCopyWith<$Res> implements $PaymentCopyWith<$Res> {
  factory _$PaymentCopyWith(_Payment value, $Res Function(_Payment) then) =
      __$PaymentCopyWithImpl<$Res>;
  @override
  $Res call(
      {double? amount,
      @JsonKey(name: "datetime", fromJson: _dateTimeFromTimeStamp, toJson: _timeStampToDateTime)
          DateTime? datetime,
      String? user,
      String? type,
      String? service});
}

/// @nodoc
class __$PaymentCopyWithImpl<$Res> extends _$PaymentCopyWithImpl<$Res>
    implements _$PaymentCopyWith<$Res> {
  __$PaymentCopyWithImpl(_Payment _value, $Res Function(_Payment) _then)
      : super(_value, (v) => _then(v as _Payment));

  @override
  _Payment get _value => super._value as _Payment;

  @override
  $Res call({
    Object? amount = freezed,
    Object? datetime = freezed,
    Object? user = freezed,
    Object? type = freezed,
    Object? service = freezed,
  }) {
    return _then(_Payment(
      amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      datetime == freezed
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String?,
      type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      service == freezed
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Payment with DiagnosticableTreeMixin implements _Payment {
  const _$_Payment(
      this.amount,
      @JsonKey(name: "datetime", fromJson: _dateTimeFromTimeStamp, toJson: _timeStampToDateTime)
          this.datetime,
      this.user,
      this.type,
      this.service);

  factory _$_Payment.fromJson(Map<String, dynamic> json) =>
      _$_$_PaymentFromJson(json);

  @override
  final double? amount;
  @override
  @JsonKey(
      name: "datetime",
      fromJson: _dateTimeFromTimeStamp,
      toJson: _timeStampToDateTime)
  final DateTime? datetime;
  @override
  final String? user;
  @override
  final String? type;
  @override
  final String? service;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Payment(amount: $amount, datetime: $datetime, user: $user, type: $type, service: $service)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Payment'))
      ..add(DiagnosticsProperty('amount', amount))
      ..add(DiagnosticsProperty('datetime', datetime))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('service', service));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Payment &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.datetime, datetime) ||
                const DeepCollectionEquality()
                    .equals(other.datetime, datetime)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.service, service) ||
                const DeepCollectionEquality().equals(other.service, service)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(datetime) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(service);

  @JsonKey(ignore: true)
  @override
  _$PaymentCopyWith<_Payment> get copyWith =>
      __$PaymentCopyWithImpl<_Payment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PaymentToJson(this);
  }
}

abstract class _Payment implements Payment {
  const factory _Payment(
      double? amount,
      @JsonKey(name: "datetime", fromJson: _dateTimeFromTimeStamp, toJson: _timeStampToDateTime)
          DateTime? datetime,
      String? user,
      String? type,
      String? service) = _$_Payment;

  factory _Payment.fromJson(Map<String, dynamic> json) = _$_Payment.fromJson;

  @override
  double? get amount => throw _privateConstructorUsedError;
  @override
  @JsonKey(
      name: "datetime",
      fromJson: _dateTimeFromTimeStamp,
      toJson: _timeStampToDateTime)
  DateTime? get datetime => throw _privateConstructorUsedError;
  @override
  String? get user => throw _privateConstructorUsedError;
  @override
  String? get type => throw _privateConstructorUsedError;
  @override
  String? get service => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PaymentCopyWith<_Payment> get copyWith =>
      throw _privateConstructorUsedError;
}
