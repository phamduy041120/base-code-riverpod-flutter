import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default('') String email,
    @Default(null) String? emailError,
    @Default('') String password,
    @Default(null) String? passwordError,
  }) = _LoginState;

  const LoginState._();
}
