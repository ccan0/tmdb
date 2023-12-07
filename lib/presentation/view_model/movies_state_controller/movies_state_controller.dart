import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movies_state_controller.g.dart';

@riverpod
class MoviesStateController extends _$MoviesStateController {

  bool isSearchedState = false;

  @override
  bool build() {
    return isSearchedState;
  }

  void changeState({required bool newValue}) {
    isSearchedState = newValue;

    state = isSearchedState;

    ref.invalidateSelf();
  }

}
