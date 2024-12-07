import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/base_view/base_view.dart';
import 'notification_view_model.dart';

final _provider = StateNotifierProvider.autoDispose(
  (ref) => NotificationViewModel(),
);

/// Screen code: A_08
@RoutePage()
class NotificationScreen extends BaseView {
  const NotificationScreen({super.key});

  @override
  BaseViewState<NotificationScreen, NotificationViewModel> createState() =>
      _NotificationScreenState();
}

class _NotificationScreenState
    extends BaseViewState<NotificationScreen, NotificationViewModel> {
  @override
  NotificationViewModel get viewModel => ref.read(_provider.notifier);

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  @override
  Widget buildBody(BuildContext context) {
    return const Center(
      child: Text('Notification screen'),
    );
  }
}
