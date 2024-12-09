import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../secure_storage/secure_storage_manager.dart';

final secureStorageProvider = Provider<SecureStorageManager>((ref) {
  return SecureStorageManager(const FlutterSecureStorage());
});
