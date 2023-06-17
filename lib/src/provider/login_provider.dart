import 'package:flutter_riverpod/flutter_riverpod.dart';

var isLoadingProvider = StateProvider<bool>((ref) => false);

var login = FutureProvider((ref) => null);