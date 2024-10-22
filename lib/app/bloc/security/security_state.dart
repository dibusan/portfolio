part of 'security_bloc.dart';

@freezed
class SecurityState with _$SecurityState {
  const factory SecurityState({
    @Default(false) bool loading,
    @Default(kDebugMode) bool isAuth,
  }) = _SecurityState;
}
