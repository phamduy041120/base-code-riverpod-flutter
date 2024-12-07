import '../../models/api/responses/post/post.dart';
import '../../models/api/responses/story/story.dart';
import '../../secure_storage/secure_storage_manager.dart';
import '../../services/api/post/api_post_client.dart';
import '../../services/api/story/api_story_client.dart';
import '../session/session_repository.dart';

abstract class ApiRepository {
  Future<List<Post>> getPostList();

  Future<List<Story>> getStoryList();
}

class ApiRepositoryImpl implements ApiRepository {
  ApiRepositoryImpl({
    required this.apiPostClient,
    required this.apiStoryClient,
    required this.sessionRepository,
    required this.secureStorageManager,
  });

  final ApiPostClient apiPostClient;

  final ApiStoryClient apiStoryClient;

  final SessionRepository sessionRepository;

  final SecureStorageManager secureStorageManager;

  @override
  Future<List<Post>> getPostList() async {
    final postListResponse = await apiPostClient.getPost();
    print('==>postListResponse: $postListResponse');

    /// Save info to session
    sessionRepository.savePostList(postListResponse);

    /// Save info to secure storage
    secureStorageManager.writePostList(postListResponse);

    return postListResponse;
  }

  @override
  Future<List<Story>> getStoryList() async {
    final storyListResponse = await apiStoryClient.getStory();

    /// Save info to session
    sessionRepository.saveStoryList(storyListResponse);

    /// Save info to secure storage
    secureStorageManager.writeStoryList(storyListResponse);

    return storyListResponse;
  }
}
