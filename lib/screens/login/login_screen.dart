import 'package:auto_route/auto_route.dart';
import 'package:base_code_riverpod_flutter/resources/gen/colors.gen.dart';
import 'package:base_code_riverpod_flutter/router/app_router.dart';
import 'package:base_code_riverpod_flutter/utilities/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/base_view/base_view.dart';
import '../../components/buttons/primary_button.dart';
import '../../components/buttons/text_hyperlink.dart';
import '../../components/input_field/text_input_field.dart';
import '../../resources/app_text_styles.dart';
import '../../resources/gen/assets.gen.dart';
import '../../utilities/constants/text_constants.dart';
import 'login_view_model.dart';

final _provider = StateNotifierProvider.autoDispose(
  (ref) => LoginViewModel(),
);

/// Screen code: A_02
@RoutePage()
class LoginScreen extends BaseView {
  const LoginScreen({super.key});

  @override
  BaseViewState<LoginScreen, LoginViewModel> createState() =>
      _LoginScreenState();
}

class _LoginScreenState extends BaseViewState<LoginScreen, LoginViewModel> {
  @override
  LoginViewModel get viewModel => ref.read(_provider.notifier);

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  @override
  Widget? buildFloatActionButton(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: PrimaryButton(
            title: TextConstants.createNewAccount,
            border: Border.all(color: ColorName.blue, width: 1),
            backgroundColor: Colors.transparent,
            titleStyle: AppTextStyles.s18w400.copyWith(
              color: ColorName.blue,
            ),
            onTap: () {
              context.router.push(const RegisterRoute());
            }),
      );

  @override
  FloatingActionButtonLocation? get floatingActionButtonLocation =>
      FloatingActionButtonLocation.centerFloat;

  @override
  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: context.screenHeightRatio * 100),
            Assets.images.facebookLogo.image(
              width: 80,
              height: 80,
              fit: BoxFit.contain,
            ),
            _buildInputView(),
            const SizedBox(height: 40),
            PrimaryButton(
                title: TextConstants.login,
                onTap: () {
                  context.router.replace(const MainRoute());
                }),
          ],
        ),
      ),
    );
  }

  Widget _buildInputView() {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        TextInputField(
          title: TextConstants.email,
          onChanged: (String value) {},
        ),
        const SizedBox(
          height: 20,
        ),
        TextInputField(
          title: TextConstants.password,
          obscureText: true,
          onChanged: (String value) {},
        ),
        const SizedBox(
          height: 15,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextHyperlink(
            title: TextConstants.forgotPasswordTitle,
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
