part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object> get props => [];
}

class Emailchanged extends LoginEvent {
  const Emailchanged({required this.email});
  final String email;

  @override
  List<Object> get props => [email];
}

class EmailUnfocused extends LoginEvent {}

class PasswordChange extends LoginEvent {
  const PasswordChange({required this.pass});
  final String pass;

  @override
  List<Object> get props => [pass];
}

class PassUnfocused extends LoginEvent {}

class Submit extends LoginEvent {}
