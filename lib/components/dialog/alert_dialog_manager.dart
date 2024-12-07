import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'error_dialog.dart';

class AlertDialogManager {
  AlertDialogManager(this.ref);

  final Ref ref;

  int numberOfShowedAlertDialogs = 0;

  Future<void> showAlertDialog({
    required BuildContext context,
    required String title,
    VoidCallback? onClosed,
  }) async {
    while (numberOfShowedAlertDialogs > 0) {
      numberOfShowedAlertDialogs--;
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      }
    }

    numberOfShowedAlertDialogs++;
    await showDialog(
        context: context,
        useRootNavigator: false,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ErrorDialog(
            title: title,
            onClosed: () {
              onClosed != null ? onClosed.call() : Navigator.of(context).pop();
              numberOfShowedAlertDialogs--;
            },
          );
        });
  }
}
