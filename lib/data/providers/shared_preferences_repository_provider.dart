import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/shared_preferences/shared_preferences_repository.dart';

final sharedPreferencesRepositoryProvider =
    Provider<SharedPreferencesRepository>((ref) {
  return SharedPreferencesRepositoryImpl();
});
