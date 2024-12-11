import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repository/auth_api/auth_repository.dart';
import '../../services/session_manager/session_controller.dart';
import '../../utils/enums.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthApiRepository authApiRepository;

  LoginBloc({required this.authApiRepository}) : super(const LoginState()) {
    on<UserNameChanged>(_onUserNameChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginApi>(_onFormSubmitted);
    on<UsernameFocusChanged>(_onUsernameFocusChanged);
  }

  void _onUserNameChanged(UserNameChanged event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        username: event.username,
      ),
    );
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        password: event.password,
      ),
    );
  }

  void _onUsernameFocusChanged(UsernameFocusChanged event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        isUsernameFocused: event.isFocused,
      ),
    );
  }

  Future<void> _onFormSubmitted(
    LoginApi event,
    Emitter<LoginState> emit,
  ) async {
    Map<String, String> data = {
      'user': state.username,
      'password': state.password,
    };
    emit(state.copyWith(
      postApiStatus: PostApiStatus.loading,
    ));
    await authApiRepository.loginApi(json.encode(data)).then((value) async {
      if (value.error.isNotEmpty) {
        emit(state.copyWith(
            postApiStatus: PostApiStatus.error, message: value.error));
      } else {
        await SessionController().saveUserInPreference(value);
        await SessionController().getUserFromPreference();
        emit(state.copyWith(postApiStatus: PostApiStatus.success));
      }
    }).onError((error, stackTrace) {
      emit(state.copyWith(
          postApiStatus: PostApiStatus.error, message: error.toString()));
    });
  }
}

