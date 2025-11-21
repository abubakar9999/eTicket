import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:eticket/src/data/repositoris/repositories.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(_Initial()) {
    on<CreateUser>((event, emit)async {

    final data =  await Repositories().createUser(event.body);

    
    if(data.contains("Unauthorized") || data.contains("error")){
      emit(UserCreationError(jsonDecode( data)['error'].toString()));
   
    }else{
      emit(UserCreated(data));
    }
    });
  }
}
