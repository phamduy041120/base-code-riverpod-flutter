import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/base_view/base_view_model.dart';
import '../../data/repositories/api/api_repository.dart';
import '../../data/repositories/session/session_repository.dart';
import '../../data/secure_storage/secure_storage_manager.dart';
import 'home_state.dart';

class HomeViewModel extends BaseViewModel<HomeState> {
  HomeViewModel({
    required this.ref,
    required this.apiRepository,
    required this.sessionRepository,
    required this.secureStorageManager,
  }) : super(const HomeState());

  final Ref ref;

  final ApiRepository apiRepository;

  final SessionRepository sessionRepository;

  final SecureStorageManager secureStorageManager;

  Future<void> onInitData() async {
    await Future.wait([
      _getPostList(),
      _getStoryList(),
    ]);
  }

  /// Call api post and handle cache data
  Future<void> _getPostList() async {
    final hasCachedPost = await _getCachedPostList();
    if (hasCachedPost) {
      unawaited(_getPostResponse());
    } else {
      await _getPostResponse();
    }
  }

  Future<bool> _getCachedPostList() async {
    /// Get info from session
    var postResponse = sessionRepository.postList();

    /// If postResponse == null, get info from secure storage
    postResponse ??= await secureStorageManager.readPostList();
    state = state.copyWith(postList: postResponse ?? []);
    return postResponse != null;
  }

  Future<void> _getPostResponse() async {
    final postResponse = await apiRepository.getPostList();
    state = state.copyWith(postList: postResponse);
  }

  /// Call api story and handle cache data
  Future<void> _getStoryList() async {
    final hasCachedStory = await _getCachedStoryList();
    if (hasCachedStory) {
      unawaited(_getStoryResponse());
    } else {
      await _getStoryResponse();
    }
  }

  Future<bool> _getCachedStoryList() async {
    /// Get info from session
    var storyResponse = sessionRepository.postList();

    /// If storyResponse == null, get info from secure storage
    storyResponse ??= await secureStorageManager.readPostList();
    state = state.copyWith(postList: storyResponse ?? []);
    return storyResponse != null;
  }

  Future<void> _getStoryResponse() async {
    final storyResponse = await apiRepository.getStoryList();
    state = state.copyWith(storyList: storyResponse);
  }
}
