import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/base_view/base_view.dart';
import '../../router/app_router.dart';
import 'video_view_model.dart';

final _provider = StateNotifierProvider.autoDispose(
  (ref) => VideoViewModel(),
);

/// Screen code: A_06
@RoutePage()
class VideoScreen extends BaseView {
  const VideoScreen({super.key});

  @override
  BaseViewState<VideoScreen, VideoViewModel> createState() =>
      _VideoScreenState();
}

class _VideoScreenState extends BaseViewState<VideoScreen, VideoViewModel> {
  @override
  VideoViewModel get viewModel => ref.read(_provider.notifier);

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  @override
  Widget buildBody(BuildContext context) {
    return const Center(
      child: Text('Video screen'),
    );
  }

  @override
  String get screenName => VideoRoute.name;
}
