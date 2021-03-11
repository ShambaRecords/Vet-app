import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vet_app/domain/repository/bookings_repository.dart';
import 'package:vet_app/util/di/injection.dart';

final bookingsStreamProvider = StreamProvider.autoDispose((ref) {
  return getIt<BookingsRepository>().getBookings();
});
