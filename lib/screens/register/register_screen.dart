import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/base_view/base_view.dart';
import '../../router/app_router.dart';
import 'register_view_model.dart';

final _provider = StateNotifierProvider.autoDispose(
  (ref) => RegisterViewModel(),
);

/// Screen code: A_03
@RoutePage()
class RegisterScreen extends BaseView {
  const RegisterScreen({super.key});

  @override
  BaseViewState<RegisterScreen, RegisterViewModel> createState() =>
      _RegisterScreenState();
}

class _RegisterScreenState
    extends BaseViewState<RegisterScreen, RegisterViewModel> {
  @override
  RegisterViewModel get viewModel => ref.read(_provider.notifier);

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  @override
  Widget buildBody(BuildContext context) {
    return const Center(
      child: Text('Register screen'),
    );
  }

  @override
  String get screenName => RegisterRoute.name;
}
