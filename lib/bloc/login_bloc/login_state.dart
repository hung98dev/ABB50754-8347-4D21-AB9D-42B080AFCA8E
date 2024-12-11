part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.username = '',
    this.password = '',
    this.postApiStatus = PostApiStatus.initial,
    this.message = '',
    this.isUsernameFocused = false,
  });

  final String username;
  final String password;
  final String message;
  final PostApiStatus postApiStatus;
  final bool isUsernameFocused; // Thêm trạng thái focus

  LoginState copyWith({
    String? username,
    String? password,
    String? message,
    PostApiStatus? postApiStatus,
    bool? isUsernameFocused,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      message: message ?? this.message,
      postApiStatus: postApiStatus ?? this.postApiStatus,
      isUsernameFocused: isUsernameFocused ?? this.isUsernameFocused,
    );
  }

  @override
  List<Object> get props => [username, password, postApiStatus, message, isUsernameFocused];
}

