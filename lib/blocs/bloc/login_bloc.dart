import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<MobileChanged>(_onMobileChanged);
    on<PasswordChanged>(_onPassChanged);
  }

  FutureOr<void> _onMobileChanged(MobileChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(mobile: event.mobile));
  }

  FutureOr<void> _onPassChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.pass));
  }
}
