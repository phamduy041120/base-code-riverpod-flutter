import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/base_view/base_view.dart';
import '../../data/providers/shared_preferences_repository_provider.dart';
import '../../resources/gen/assets.gen.dart';
import '../../router/app_router.dart';
import 'splash_view_model.dart';

final _provider = StateNotifierProvider.autoDispose(
  (ref) => SplashViewModel(),
);

/// Screen code: A_01
@RoutePage()
class SplashScreen extends BaseView {
  const SplashScreen({super.key});

  @override
  BaseViewState<SplashScreen, SplashViewModel> createState() =>
      _SplashScreenState();
}

class _SplashScreenState extends BaseViewState<SplashScreen, SplashViewModel> {
  @override
  get viewModel => ref.read(_provider.notifier);

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () async {
      await _bootstrap();
    });
  }

  Future<void> _bootstrap() async {
    final isFirstRunApp =
        await ref.watch(sharedPreferencesRepositoryProvider).readFirstRunApp();
    if (!mounted) return;
    if (isFirstRunApp ?? false) {
      await AutoRouter.of(context).replace(
        const MainRoute(),
      );
    } else {
      await AutoRouter.of(context).replace(
        const LoginRoute(),
      );
    }
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  @override
  Widget buildBody(BuildContext context) {
    return Center(
      child: Assets.images.facebookLogo.image(
        width: 60,
        height: 60,
        fit: BoxFit.contain,
      ),
    );
  }

  @override
  String get screenName => SplashRoute.name;
}
