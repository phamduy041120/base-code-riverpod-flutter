import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/base_view/base_view.dart';
import '../../router/app_router.dart';
import 'components/bottom_tab_bar.dart';
import 'main_view_model.dart';

final _provider = StateNotifierProvider.autoDispose(
  (ref) => MainViewModel(),
);

/// Screen code: A_04
@RoutePage()
class MainScreen extends BaseView {
  const MainScreen({super.key});

  @override
  BaseViewState<MainScreen, MainViewModel> createState() => _MainScreenState();
}

class _MainScreenState extends BaseViewState<MainScreen, MainViewModel> {
  @override
  MainViewModel get viewModel => ref.read(_provider.notifier);

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  @override
  Widget buildBody(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeTabRoute(),
        VideoTabRoute(),
        MarketplaceTabRoute(),
        DatingTabRoute(),
        NotificationTabRoute(),
        MenuTabRoute(),
      ],
      resizeToAvoidBottomInset: true,
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomTabBar(tabsRouter: tabsRouter);
      },
    );
  }
}
