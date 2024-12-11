part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class UserNameChanged extends LoginEvent {
  const UserNameChanged({required this.username});

  final String username;

  @override
  List<Object> get props => [username];
}

class UsernameFocusChanged extends LoginEvent {
  const UsernameFocusChanged({required this.isFocused});

  final bool isFocused;

  @override
  List<Object> get props => [isFocused];
}


class PasswordChanged extends LoginEvent {
  const PasswordChanged({required this.password});

  final String password;

  @override
  List<Object> get props => [password];
}


class LoginApi extends LoginEvent {}
