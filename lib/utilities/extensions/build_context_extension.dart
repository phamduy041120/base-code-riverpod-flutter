import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

extension BuildContextExtension on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;

  double get screenWidthRatio =>
      MediaQuery.of(this).size.width / AppConstants.designScreenWidth;

  double get screenHeightRatio =>
      MediaQuery.of(this).size.height / AppConstants.designScreenHeight;
}
