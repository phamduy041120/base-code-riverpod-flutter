import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/app_bar/menu_app_bar.dart';
import '../../components/base_view/base_view.dart';
import '../../components/divider/divider_horizontal.dart';
import '../../components/loading/container_with_loading.dart';
import '../../data/models/api/responses/post/post.dart';
import '../../data/providers/api_repository_provider.dart';
import '../../data/providers/secure_storage_provider.dart';
import '../../data/providers/session_repository_provider.dart';
import '../../router/app_router.dart';
import '../../utilities/constants/app_constants.dart';
import '../../utilities/constants/text_constants.dart';
import 'components/create_post.dart';
import 'components/create_story.dart';
import 'components/post_item.dart';
import 'components/story_item.dart';
import 'home_state.dart';
import 'home_view_model.dart';

final _provider = StateNotifierProvider.autoDispose<HomeViewModel, HomeState>(
  (ref) => HomeViewModel(
    ref: ref,
    apiRepository: ref.watch(apiRepositoryProvider),
    sessionRepository: ref.watch(sessionRepositoryProvider),
    secureStorageManager: ref.watch(secureStorageProvider),
  ),
);

/// Screen code: A_05
@RoutePage()
class HomeScreen extends BaseView {
  const HomeScreen({super.key});

  @override
  BaseViewState<HomeScreen, HomeViewModel> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseViewState<HomeScreen, HomeViewModel> {
  @override
  HomeViewModel get viewModel => ref.read(_provider.notifier);

  HomeState get state => ref.watch(_provider);

  @override
  Future<void> onInitState() async {
    super.onInitState();
    await Future.delayed(Duration.zero, () async {
      await onWhileLoadingData(future: () async {
        await viewModel.onInitData();
      });
    });
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) => MenuAppBar(
        title: TextConstants.facebook,
        onAddIconTap: () {},
        onSearchIconTap: () {},
        onMessengerIconTap: () {},
      );

  @override
  Widget buildBody(BuildContext context) {
    return ContainerWithLoading(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CreatePost(
                  imageUrl: AppConstants.userNameImage,
                  onOpenProfileTap: () {},
                  onOpenPostTap: () {},
                  onOpenPhotosTap: () {},
                  onLiveTap: () {},
                  onPhotoTap: () {},
                  onRoomTap: () {},
                ),
                const DividerHorizontal(height: 5),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: _buildStoryListData(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final Post post = state.postList[index];
                return PostItem(
                  post: post,
                  onMoreTap: () {},
                  onClosePostTap: () {},
                  onStatusIconTap: () {},
                  onLikeTap: () {},
                  onCommentsTap: () {},
                  onShareTap: () {},
                );
              },
              childCount: state.postList.length,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildStoryListData() {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 4.0,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: state.storyList.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return CreateStory(
                  onCreateStoryTap: () {},
                );
              }
              final story = state.storyList[index - 1];
              return StoryItem(story: story);
            },
          ),
        ),
        const DividerHorizontal(height: 5),
      ],
    );
  }

  @override
  String get screenName => HomeRoute.name;
}
