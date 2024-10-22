import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';

part 'security_event.dart';

part 'security_state.dart';

part 'security_bloc.freezed.dart';

class SecurityBloc extends Bloc<SecurityEvent, SecurityState> {
  final GlobalKey<FormState> formKey = GlobalKey();

  SecurityBloc() : super(const SecurityState()) {
    on<SecurityCheckPasswordEvent>((event, emit) async {
      emit(state.copyWith(loading: true, isAuth: false));
      await Future.delayed(const Duration(seconds: 2));
      if (event.password == event.developer.password) {
        emit(state.copyWith(isAuth: true));
      }
      emit(state.copyWith(loading: false));
    });
  }
}
