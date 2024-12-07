import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/api/api_repository.dart';
import 'api_post_client_provider.dart';
import 'api_story_client_provider.dart';
import 'secure_storage_provider.dart';
import 'session_repository_provider.dart';

final apiRepositoryProvider = Provider<ApiRepository>((ref) {
  return ApiRepositoryImpl(
    apiPostClient: ref.watch(apiPostClientProvider),
    apiStoryClient: ref.watch(apiStoryClientProvider),
    sessionRepository: ref.watch(sessionRepositoryProvider),
    secureStorageManager: ref.watch(secureStorageProvider),
  );
});
