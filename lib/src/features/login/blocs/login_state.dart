part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String mobile;
  final String password;
  final String companyId;
  final bool isMaster;
  final String message;
  final String error;
  final bool loading;

  const LoginState({
    this.mobile = '',
    this.password = '',
    this.companyId = '',
    this.isMaster = true,
    this.message = '',
    this.error = '',
    this.loading = false,
  });

  LoginState copyWith({
    String? mobile,
    String? password,
    String? companyId,
    bool? isMaster,
    String? message,
    String? error,
    bool? loading,
  }) {
    return LoginState(
      mobile: mobile ?? this.mobile,
      password: password ?? this.password,
      companyId: companyId ?? this.companyId,
      isMaster: isMaster ?? this.isMaster,
      message: message ?? this.message,
      error: error ?? this.error,
      loading: loading ?? this.loading,
    );
  }

  @override
  List<Object?> get props => [mobile, password, companyId, isMaster, message, error, loading];
}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String message;
  const LoginSuccess({this.message = "Login successful"});
}

class LoginFailure extends LoginState {
  final String error;
  const LoginFailure({required this.error});
}