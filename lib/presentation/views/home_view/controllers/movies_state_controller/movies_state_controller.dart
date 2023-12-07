import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movies_state_controller.g.dart';

@riverpod
class MoviesStateController extends _$MoviesStateController {

  bool _isSearchedState = false;

  @override
  bool build() {
    return _isSearchedState;
  }

  void changeState({required bool newValue}) {
    _isSearchedState = newValue;

    state = _isSearchedState;

    ref.invalidateSelf();
  }

}
