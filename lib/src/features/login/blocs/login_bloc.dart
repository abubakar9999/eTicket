import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eticket/session_manager.dart';
import 'package:eticket/src/core/constants/hive_constants.dart';
import 'package:eticket/src/data/data_sources/local/local_data_sorce.dart';
import 'package:eticket/src/data/data_sources/remort/remote_data_sorce.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<MobileChanged>(_onMobileChanged);
    on<PasswordChanged>(_onPassChanged);
    on<CompanyIdChanged>(_onCompanyIdChanged);
    on<IsMasterChanged>(_onIsMasterChanged);
    on<Submit>(_onSubmit);
  }

  FutureOr<void> _onMobileChanged(MobileChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(mobile: event.mobile));
  }

  FutureOr<void> _onPassChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.pass));
  }

  FutureOr<void> _onCompanyIdChanged(CompanyIdChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(companyId: event.companyId));
  }

  FutureOr<void> _onIsMasterChanged(IsMasterChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(isMaster: event.isMaster));
  }

FutureOr<void> _onSubmit(Submit event, Emitter<LoginState> emit) async {
  emit(LoginLoading());
  try {
    final body = {
      "phone": event.mobile.trim(),
      "password": event.pass.trim(),
    };

  

    print("Login body => $body"); // ✅ Debug check

    final data =!state.isMaster && state.companyId.trim().isNotEmpty? await GetDataFromAPi().subuserLogIn(body, state.companyId): await GetDataFromAPi().logIn(body);

    if ((data.data?.token ?? '').isNotEmpty || data.message == "OK") {
      SessionManager prefs = SessionManager();
      await prefs.setAuthToken(data.data!.token!);
      await prefs.setLogin(true);
      emit(LoginSuccess(message: data.message ?? "Login successful"));
    } else {
      emit(LoginFailure(error: data.message ?? "Login failed"));
    }
  } catch (e) {
    emit(LoginFailure(error: e.toString()));
  }
}


}
