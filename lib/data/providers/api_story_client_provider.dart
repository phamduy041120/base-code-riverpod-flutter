import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../services/api/story/api_story_client.dart';

final apiStoryClientProvider = Provider<ApiStoryClient>((ref) {
  final dio = Dio();

  /// Only show the API request log in debug mode
  if (kDebugMode) {
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 99,
      ),
    );
  }

  return ApiStoryClient(dio);
});
