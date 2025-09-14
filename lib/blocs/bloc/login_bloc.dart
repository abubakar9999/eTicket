import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<Emailchanged>(_onEmailchanged);
    on<PasswordChange>(_onPasschanged);
  }

  FutureOr<void> _onEmailchanged(Emailchanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  FutureOr<void> _onPasschanged(PasswordChange event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.pass));
  }
}
