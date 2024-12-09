import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/dialog/alert_dialog_manager.dart';

final alertDialogManagerProvider = Provider<AlertDialogManager>((ref) {
  return AlertDialogManager(ref);
});
