import 'package:hooks_riverpod/hooks_riverpod.dart';

final selectedTimesStateProvider = StateProvider((ref) => DateTime.now());
final loaderStateProvider = StateProvider((ref) => false);