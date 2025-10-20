part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class MobileChanged extends LoginEvent {
  const MobileChanged({required this.mobile});
  final String mobile;

  @override
  List<Object> get props => [mobile];
}

class MobileUnfocused extends LoginEvent {}

class PasswordChanged extends LoginEvent {
  const PasswordChanged({required this.pass});
  final String pass;

  @override
  List<Object> get props => [pass];
}

class PassUnfocused extends LoginEvent {}

class Submit extends LoginEvent {
  String mobile;
  String pass;
  Submit({required this.mobile, required this.pass});
}

