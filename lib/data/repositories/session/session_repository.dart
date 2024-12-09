import '../../models/api/responses/post/post.dart';
import '../../models/api/responses/story/story.dart';

abstract class SessionRepository {
  List<Story>? storyList();

  void saveStoryList(List<Story>? storyList);

  List<Post>? postList();

  void savePostList(List<Post>? postList);
}

class SessionRepositoryImpl implements SessionRepository {
  List<Story>? _storyList;

  List<Post>? _postList;

  @override
  List<Story>? storyList() {
    return _storyList;
  }

  @override
  void saveStoryList(List<Story>? storyList) {
    _storyList = storyList;
  }

  @override
  List<Post>? postList() {
    return _postList;
  }

  @override
  void savePostList(List<Post>? postList) {
    _postList = postList;
  }
}
