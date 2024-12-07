import 'package:flutter/material.dart';

import '../../resources/gen/colors.gen.dart';

class ProgressHud extends StatelessWidget {
  const ProgressHud({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: IgnorePointer(
        ignoring: true,
        child: Center(
          child: SizedBox(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(ColorName.green5FC1C7),
            ),
          ),
        ),
      ),
    );
  }
}
