part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object?> get props => [];
}

class MobileChanged extends LoginEvent {
  final String mobile;
  const MobileChanged(this.mobile);
}

class PasswordChanged extends LoginEvent {
  final String pass;
  const PasswordChanged(this.pass);
}

class CompanyIdChanged extends LoginEvent {
  final String companyId;
  const CompanyIdChanged(this.companyId);
}

class IsMasterChanged extends LoginEvent {
  final bool isMaster;
  const IsMasterChanged(this.isMaster);
}

class Submit extends LoginEvent {
  final String mobile;
  final String pass;
  const Submit({required this.mobile, required this.pass});
}
