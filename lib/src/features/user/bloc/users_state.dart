part of 'users_bloc.dart';

abstract class UsersState {}
class _Initial extends UsersState {}
class UsersLoading extends UsersState {}
class UsersLoaded extends UsersState {
  final List<dynamic> users; // Replace dynamic with your user model class  
  UsersLoaded(this.users);
}
class UsersError extends UsersState {
  final String message;
  UsersError(this.message);
}
class UserCreated extends UsersState {
  final String response; // You can change this to a more specific type if needed
  UserCreated(this.response);
}
class UserCreationError extends UsersState {
  final String message;
  UserCreationError(this.message);
}