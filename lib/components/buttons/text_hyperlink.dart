import 'package:flutter/material.dart';

import '../../resources/app_text_styles.dart';
import '../../resources/gen/colors.gen.dart';

class TextHyperlink extends StatelessWidget {
  const TextHyperlink({
    required this.title,
    required this.onTap,
    super.key,
  });

  final String title;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Text(
        title,
        style: AppTextStyles.s14w400.copyWith(
          color: ColorName.black,
          decoration: TextDecoration.underline,
          decorationColor: ColorName.black,
        ),
      ),
    );
  }
}
