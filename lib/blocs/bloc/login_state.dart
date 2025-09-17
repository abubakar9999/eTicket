part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.mobile = '',
    this.password = '',
  });

  final String mobile;
  final String password;

  LoginState copyWith({String? mobile, String? password}) {
    return LoginState(mobile: mobile ?? this.mobile, password: password ?? this.password);
  }

  @override
  List<Object> get props => [mobile, password];
}
