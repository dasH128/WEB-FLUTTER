import 'package:flutter_riverpod/flutter_riverpod.dart';

final islaOfWorkerProvider = StateProvider.autoDispose<String>((ref) => '');
final nameOfWorkerProvider = StateProvider.autoDispose<String>((ref) => '');
final lastNameOfWorkerProvider = StateProvider.autoDispose<String>((ref) => '');
final dniOfWorkerProvider = StateProvider.autoDispose<String>((ref) => '');
final emailOfWorkerProvider = StateProvider.autoDispose<String>((ref) => '');
