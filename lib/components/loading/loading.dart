import 'package:flutter/material.dart';

import '../../resources/gen/colors.gen.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.transparent,
        width: 24,
        height: 24,
        child: const IgnorePointer(
          ignoring: true,
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(ColorName.white),
              strokeWidth: 2,
            ),
          ),
        ),
      ),
    );
  }
}
