import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_state_controller.g.dart';

@riverpod
class SearchStateController extends _$SearchStateController {

  bool isSearchedState = false;

  @override
  bool build() {
    return isSearchedState;
  }

  void changeOpenState() {
    isSearchedState = !isSearchedState;

    state = isSearchedState;

    ref.invalidateSelf();
  }

}
