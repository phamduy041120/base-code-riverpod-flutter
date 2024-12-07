import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/loading/progress_hub.dart';
import 'app_router_provider.dart';

final progressHudManagerProvider =
    Provider<ProgressHudManager>((ref) => ProgressHudManager(ref));

class ProgressHudManager {
  ProgressHudManager(this.ref);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  final Ref ref;

  Future<dynamic> whileLoading(Future Function() future) async {
    return Future.microtask(_toLoading)
        .then((_) => future())
        .whenComplete(_toIdle);
  }

  void _toLoading() {
    if (_isLoading) {
      return;
    }
    _isLoading = true;
    presentProgressHud();
  }

  void _toIdle() {
    if (!_isLoading) {
      return;
    }
    dismissProgressHud();
    _isLoading = false;
  }

  Future<void> presentProgressHud() async {
    final currentContext =
        ref.watch(appRouterProvider).navigatorKey.currentContext;
    if (currentContext == null) {
      return;
    }

    await showDialog(
      context: currentContext,
      useRootNavigator: false,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.3),
      builder: (context) {
        return const PopScope(
          canPop: false,
          child: SimpleDialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            children: [ProgressHud()],
          ),
        );
      },
    );
  }

  Future<void> dismissProgressHud() async {
    ref.watch(appRouterProvider).maybePop();
  }
}
