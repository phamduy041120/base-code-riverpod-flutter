import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/base_view/base_view_model.dart';
import '../../data/repositories/shared_preferences/shared_preferences_repository.dart';
import '../../utilities/utilities.dart';
import 'login_state.dart';

class LoginViewModel extends BaseViewModel<LoginState> {
  LoginViewModel({
    required this.ref,
    required this.sharedPreferencesRepository,
  }) : super(const LoginState());

  final Ref ref;

  final SharedPreferencesRepository sharedPreferencesRepository;

  void onEmailChanged(String email) {
    state = state.copyWith(email: email);
  }

  void onEmailValidated() {
    final newValue = state.email.trim();
    final emailError = Utilities.validateEmail(newValue);
    state = state.copyWith(
      email: newValue,
      emailError: emailError,
    );
  }

  void onEmailFocus() {
    state = state.copyWith(emailError: null);
  }

  void onPasswordChanged(String password) {
    state = state.copyWith(password: password);
  }

  void onPasswordValidated() {
    final newPassword = state.password.trim();
    final passwordError = Utilities.validatePassword(newPassword);
    state = state.copyWith(
      password: newPassword,
      passwordError: passwordError,
    );
  }

  void onPasswordFocus() {
    state = state.copyWith(passwordError: null);
  }

  bool getEnableButton() {
    return Utilities.validateEmail(state.email.trim()) == null &&
        Utilities.validatePassword(state.password.trim()) == null;
  }

  Future<void> setIsFirstRunApp({
    required bool isFirstRunApp,
  }) async {
    await sharedPreferencesRepository.saveFirstRunApp(
      isFirstRunApp: isFirstRunApp,
    );
  }
}
