import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_state_controller.g.dart';

@riverpod
class SearchStateController extends _$SearchStateController {

  bool _isSearchedState = false;

  @override
  bool build() {
    return _isSearchedState;
  }

  void changeOpenState() {
    _isSearchedState = !_isSearchedState;

    state = _isSearchedState;

    ref.invalidateSelf();
  }

}
