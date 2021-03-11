import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:vet_app/domain/api/api_provider.dart';
import 'package:vet_app/res/strings.dart';
import 'package:vet_app/util/di/injection.dart';

@injectable
class PaymentsRepository {
  addPayment(body) async {}

  /// Return a stream of a list of payments
  Stream<QuerySnapshot> getPayments() {
    return getIt<ApiBaseProvider>().get(PAYMENTS_URL, false);
  }

  /// Return a stream of a filtered list of payments(By date)
  Stream<QuerySnapshot> getPaymentsFilteredByDate(
      Timestamp startTime, Timestamp endTime) {
    return getIt<ApiBaseProvider>()
        .filterByDate(PAYMENTS_URL, false, startTime, endTime);
  }
}
