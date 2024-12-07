import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/api/responses/post/post.dart';
import '../../data/models/api/responses/story/story.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<Story> storyList,
    @Default([]) List<Post> postList,
  }) = _HomeState;

  const HomeState._();
}
