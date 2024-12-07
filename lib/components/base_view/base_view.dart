import 'package:base_code_riverpod_flutter/components/dialog/alert_dialog_manager.dart';
import 'package:base_code_riverpod_flutter/data/providers/alert_dialog_manager_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../data/providers/progress_hud_manager_provider.dart';
import '../../utilities/constants/text_constants.dart';
import 'base_view_mixin.dart';
import 'base_view_model.dart';

abstract class BaseView extends ConsumerStatefulWidget {
  const BaseView({super.key});
}

abstract class BaseViewState<View extends BaseView,
        ViewModel extends BaseViewModel> extends ConsumerState<View>
    with BaseViewMixin {
  final logger = Logger();

  ViewModel get viewModel;

  ProgressHudManager get progressHudManager =>
      ref.watch(progressHudManagerProvider);

  AlertDialogManager get alertDialogManager =>
      ref.watch(alertDialogManagerProvider);

  @override
  void initState() {
    super.initState();
    onInitState();
  }

  @override
  void dispose() {
    onDispose();
    super.dispose();
  }

  @mustCallSuper
  void onInitState() {
    logger.d('Init State: $runtimeType');
  }

  @mustCallSuper
  void onDispose() {
    logger.d('Dispose: $runtimeType');
  }

  @override
  Widget build(BuildContext context) => buildView(context);

  Future<void> onWhileLoadingData({required Future Function() future}) async {
    Object? error;
    await progressHudManager.whileLoading(() async {
      try {
        future;
      } catch (e) {
        error = e;
      }
    });
    if (error != null) {
      handleError(error!);
    }
  }

  Future<void> handleError(
    Object error, {
    String Function(Map<String, dynamic>)? handleAppError,
    void Function()? onButtonTapped,
  }) async {
    String? errorMessage;

    if (error is Exception) {
      errorMessage = error.toString();
    }

    if (errorMessage?.isEmpty ?? true) {
      errorMessage = TextConstants.unknown;
    }

    await alertDialogManager.showAlertDialog(
      context: context,
      title: errorMessage ?? '',
      onClosed: onButtonTapped,
    );
  }
}
