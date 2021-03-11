import 'package:hooks_riverpod/hooks_riverpod.dart';

final selectedDateStateProvider = StateProvider<DateTime?>((ref) => DateTime.now());
final focusedDateStateProvider = StateProvider<DateTime?>((ref) => DateTime.now());
