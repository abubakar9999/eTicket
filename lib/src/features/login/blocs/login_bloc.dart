import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eticket/src/core/constants/hive_constants.dart';
import 'package:eticket/src/data/data_sources/local/local_data_sorce.dart';
import 'package:eticket/src/data/data_sources/remort/remote_data_sorce.dart';

part 'login_event.dart';
part 'login_state.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<MobileChanged>(_onMobileChanged);
    on<PasswordChanged>(_onPassChanged);
    // log in submit
    on<Submit>(_onSubmit);
  }
  FutureOr<void> _onSubmit(Submit event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      

      final data=await GetDataFromAPi().logIn({
        "phone": event.mobile.trim(),
        "password": event.pass.trim(),
      });
      print('sarowar');
      print('${data.data?.token}');
      print('${data.message}');
      if((data.data?.token ?? '').isNotEmpty || data.message =="OK"){
        // Login successful
        //await HiveOperation().addData(data.data!.token , HiveBoxKeys.tocken);
        
        emit(LoginSuccess());
      }else{
        emit(LoginFailure(error: data.message ?? "Login failed"));
      }
    } catch (e) {
      // If login fails
      emit(LoginFailure(error: e.toString()));
    }
  }

  FutureOr<void> _onMobileChanged(MobileChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(mobile: event.mobile));
  }

  FutureOr<void> _onPassChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.pass));
  }
}
