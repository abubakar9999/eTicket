part of 'users_bloc.dart';

abstract class UsersEvent {}
class LoadUsers extends UsersEvent {
  final int role;

  LoadUsers(this.role);
}
class CreateUser extends UsersEvent {
  final Map<String, dynamic> body;

  CreateUser(this.body);
}