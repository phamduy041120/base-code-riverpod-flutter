import 'package:flutter/material.dart';

import '../../resources/app_text_styles.dart';
import '../../resources/gen/colors.gen.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.title,
    required this.onTap,
    this.width = double.infinity,
    this.height = 52,
    this.linearGradient,
    this.enable = true,
    this.titleStyle,
    this.border,
    this.backgroundColor,
    super.key,
  });

  final double width;

  final double height;

  final String title;

  final LinearGradient? linearGradient;

  final VoidCallback onTap;

  final bool enable;

  final TextStyle? titleStyle;

  final BoxBorder? border;

  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enable ? onTap : null,
      behavior: HitTestBehavior.translucent,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor ??
              (enable ? ColorName.blue : ColorName.grayE3E3E3),
          borderRadius: BorderRadius.circular(28),
          border: border ?? Border.all(color: Colors.transparent),
        ),
        child: Center(
          child: Text(
            title,
            style: titleStyle ??
                AppTextStyles.s16w400.copyWith(
                  color: enable ? ColorName.white : ColorName.black,
                ),
          ),
        ),
      ),
    );
  }
}
