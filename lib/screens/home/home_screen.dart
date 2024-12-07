import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/base_view/base_view.dart';
import 'home_view_model.dart';

final _provider = StateNotifierProvider.autoDispose(
  (ref) => HomeViewModel(),
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

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  @override
  Widget buildBody(BuildContext context) {
    return const Center(
      child: Text('Home screen'),
    );
  }
}
