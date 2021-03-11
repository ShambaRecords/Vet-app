import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:vet_app/data/model/freezed_classes.dart';
import 'package:vet_app/domain/api/api_provider.dart';
import 'package:vet_app/res/strings.dart';
import 'package:vet_app/util/di/injection.dart';

@injectable
class BookingsRepository {
  Future addBooking(Booking data) async {
    return await getIt<ApiBaseProvider>().post(BOOKINGS_URL, data, false);
  }

  /// Return a stream of a list of bookings
  Stream<QuerySnapshot> getBookings() {
    return getIt<ApiBaseProvider>().get(BOOKINGS_URL, false);
  }
}
