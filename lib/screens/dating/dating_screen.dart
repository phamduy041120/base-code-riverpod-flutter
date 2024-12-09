import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/base_view/base_view.dart';
import '../../router/app_router.dart';
import 'dating_view_model.dart';

final _provider = StateNotifierProvider.autoDispose(
  (ref) => DatingViewModel(),
);

/// Screen code: A_08
@RoutePage()
class DatingScreen extends BaseView {
  const DatingScreen({super.key});

  @override
  BaseViewState<DatingScreen, DatingViewModel> createState() =>
      _DatingScreenState();
}

class _DatingScreenState extends BaseViewState<DatingScreen, DatingViewModel> {
  @override
  DatingViewModel get viewModel => ref.read(_provider.notifier);

  @override
  String get screenName => DatingRoute.name;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  @override
  Widget buildBody(BuildContext context) {
    return const Center(
      child: Text('Dating screen'),
    );
  }
}
