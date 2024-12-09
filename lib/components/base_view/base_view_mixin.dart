import 'package:base_code_riverpod_flutter/utilities/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

import '../../resources/gen/colors.gen.dart';

mixin BaseViewMixin {
  bool get resizeToAvoidBottomInset => false;

  bool get tapOutsideToDismissKeyboard => false;

  bool get extendBodyBehindAppBar => false;

  Color get backgroundColor => ColorName.white;

  bool get ignoreSafeAreaTop => true;

  bool get ignoreSafeAreaBottom => true;

  FloatingActionButtonLocation? get floatingActionButtonLocation => null;

  Widget buildBody(BuildContext context);

  PreferredSizeWidget? buildAppBar(BuildContext context);

  BoxDecoration? buildBackgroundGradient() => null;

  Widget? buildBottomNavigationBar(BuildContext context) => null;

  Widget? buildBottomSheet(BuildContext context) => null;

  Widget? buildDrawer(BuildContext context) => null;

  Widget? buildEndDrawer(BuildContext context) => null;

  Widget? buildFloatActionButton(BuildContext context) => null;

  bool get canPop => true;

  Function(bool)? onPopInvoked() => null;

  String get screenName;

  Widget buildView(BuildContext context) => _buildContent(context);

  Widget _buildContent(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: buildAppBar(context),
      body: SafeArea(
        top: ignoreSafeAreaTop,
        bottom: ignoreSafeAreaBottom,
        child: PopScope(
          canPop: canPop,
          onPopInvoked: onPopInvoked(),
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              if (tapOutsideToDismissKeyboard) {
                dismissKeyboard(context);
              }
            },
            child: tapOutsideToDismissKeyboard
                ? SizedBox(
                    width: context.screenWidth,
                    height: context.screenHeight,
                    child: buildBody(context),
                  )
                : buildBody(context),
          ),
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(context),
      bottomSheet: buildBottomSheet(context),
      drawer: buildDrawer(context),
      endDrawer: buildEndDrawer(context),
      floatingActionButton: buildFloatActionButton(context),
      floatingActionButtonLocation: floatingActionButtonLocation,
    );
  }

  void dismissKeyboard(BuildContext context) {
    if (FocusScope.of(context).hasFocus) {
      FocusScope.of(context).unfocus();
    } else {
      FocusScope.of(context).requestFocus(FocusNode());
    }
  }
}
