part of 'security_bloc.dart';

@freezed
class SecurityState with _$SecurityState {
  const factory SecurityState({
    @Default(false) bool loading,
    @Default(false) bool isAuth,
  }) = _SecurityState;
}
