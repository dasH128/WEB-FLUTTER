import 'package:flutter_riverpod/flutter_riverpod.dart';

var isLoadingProvider = StateProvider<bool>((ref) => false);
var emailProvider = StateProvider<String>((ref) => '');
var passwordProvider = StateProvider<String>((ref) => '');

var login = FutureProvider((ref) => null);
