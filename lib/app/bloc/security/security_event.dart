part of 'security_bloc.dart';

@freezed
class SecurityEvent with _$SecurityEvent {
  const factory SecurityEvent.checkPassword({
    required String password,
    required Developer developer,
  }) = SecurityCheckPasswordEvent;
}
