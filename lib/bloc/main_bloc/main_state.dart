part of 'main_bloc.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    required int currentIndex,
  }) = _MainState;
}
