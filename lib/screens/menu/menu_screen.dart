import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/base_view/base_view.dart';
import 'menu_view_model.dart';

final _provider = StateNotifierProvider.autoDispose(
  (ref) => MenuViewModel(),
);

/// Screen code: A_09
@RoutePage()
class MenuScreen extends BaseView {
  const MenuScreen({super.key});

  @override
  BaseViewState<MenuScreen, MenuViewModel> createState() => _MenuScreenState();
}

class _MenuScreenState extends BaseViewState<MenuScreen, MenuViewModel> {
  @override
  MenuViewModel get viewModel => ref.read(_provider.notifier);

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  @override
  Widget buildBody(BuildContext context) {
    return const Center(
      child: Text('Menu screen'),
    );
  }
}
