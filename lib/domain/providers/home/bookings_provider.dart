import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vet_app/domain/repository/bookings_repository.dart';
import 'package:vet_app/util/di/injection.dart';

final bookingsStreamProvider = StreamProvider.autoDispose(
  (ref) {
    ref.maintainState = true;
    Stream<QuerySnapshot> stream = getIt<BookingsRepository>().getBookings();


    return stream;
  },
);
