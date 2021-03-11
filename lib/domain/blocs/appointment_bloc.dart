import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vet_app/res/values.dart';

@injectable
class AppointmentBloc {
  //Declare Streams
  final _animal = BehaviorSubject<String>();
  final _datetime = BehaviorSubject<DateTime>();
  final _species = BehaviorSubject<String>();
  final _user = BehaviorSubject<String>();
  final _reason = BehaviorSubject<String>.seeded("Visitation Reason");

  //Get
  Stream<String> get animal => _animal.stream.transform(validateNames);
  Stream<DateTime> get datetime => _datetime.stream;
  Stream<String> get species => _species.stream.transform(validateNames);
  Stream<String> get user => _user.stream.transform(validateNames);
  Stream<String> get reason => _reason.stream.transform(validateNames);

  Stream<bool> get inputValid => Rx.combineLatest4(
      animal,
      species,
      user,
      reason,
      (
        a,
        b,
        c,
        d,
      ) =>
          true);

  //Set
  Function(String) get changeAnimal => _animal.sink.add;
  Function(DateTime) get changeDate => _datetime.sink.add;
  Function(String) get changeSpecies => _species.sink.add;
  Function(String) get changeUser => _user.sink.add;
  Function(String) get changeReason => _reason.sink.add;

  // Validators
  final validateNames =
      StreamTransformer<String, String>.fromHandlers(handleData: (fName, sink) {
    if (fName.length < 3) {
      sink.addError('Minimum 3 characters');
    } else {
      sink.add(fName);
    }
  });

  final validatePhoneNumberSuffix =
      StreamTransformer<String, String>.fromHandlers(handleData: (phone, sink) {
    if (phone.length != 9) {
      sink.addError('Invalid phone number');
    } else {
      sink.add(phone);
    }
  });

  dispose() {
    _animal.close();
    _datetime.close();
    _species.close();
    _user.close();
    _reason.close();
  }
}
