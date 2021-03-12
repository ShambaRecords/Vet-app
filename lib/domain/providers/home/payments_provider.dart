import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vet_app/domain/repository/payments_repository.dart';
import 'package:vet_app/util/di/injection.dart';

final paymentsStreamProvider = StreamProvider.autoDispose((ref) {
  return getIt<PaymentsRepository>().getPayments();
});

final filteredPaymentsStreamProvider = StreamProvider.autoDispose((ref) {
  var startTime = ref.watch(startTimeProvider).state;
  var endTime = ref.watch(endTimeProvider).state;

  return getIt<PaymentsRepository>()
      .getPaymentsFilteredByDate(startTime, endTime);
});

final startTimeProvider = StateProvider(
    (ref) => Timestamp.fromDate(DateTime.now().subtract(Duration(days: 7))));
final endTimeProvider =
    StateProvider((ref) => Timestamp.fromDate(DateTime.now()));
