import 'package:flutter/material.dart';

import '../../resources/app_text_styles.dart';
import '../../resources/gen/colors.gen.dart';
import '../../utilities/constants/text_constants.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    super.key,
    this.onClosed,
    required this.title,
  });

  final String title;

  final VoidCallback? onClosed;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Dialog(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                title,
                style: AppTextStyles.s18w400,
              ),
            ),
            const Divider(
              height: 1,
              color: ColorName.grayE3E3E3,
            ),
            GestureDetector(
              onTap: onClosed ??
                  () {
                    Navigator.of(context).pop();
                  },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(11),
                    bottomRight: Radius.circular(11),
                  ),
                ),
                child: Text(
                  TextConstants.close,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.s16w400.copyWith(color: ColorName.blue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
