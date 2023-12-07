import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tmbd/models/movie_detail_model/movie_detail_model.dart';
import 'package:tmbd/models/movies_model/movies_model.dart';
import 'package:tmbd/presentation/view_model/movies_state_controller/movies_state_controller.dart';
import 'package:tmbd/services/movies_service/movies_service.dart';

part 'searched_movies_view_model.g.dart';

@riverpod
class SearchedMoviesViewModel extends _$SearchedMoviesViewModel {
  final List<MovieDetailModel> _movies = [];
  int _page = 1;
  int _totalPage = 1;
  bool _isRequestRunning = false;
  String _query = "";

  @override
  Future<List<MovieDetailModel>> build({ScrollController? scrollController}) async {
    scrollController?.addListener(() async{
      if (!_isRequestRunning && scrollController.position.pixels > 0.8 * scrollController.position.maxScrollExtent) {
        await getSearchedMovieList();
      }
    });

    return Future.value(_movies);
  }

  Future<void> getSearchedMovieList() async {
    if (_page != 1 && _page > _totalPage) return;

    _isRequestRunning = true;

    MoviesModel? response = await MoviesService().getSearchedMovies(page: _page.toString(), query: _query);

    if (response != null && (response.results?.isNotEmpty ?? false)) {

      _movies.addAll(response.results ?? []);

      _totalPage = response.total_pages ?? 1;
      _page++;

      state = AsyncData(_movies);
    }

    if(_movies.isNotEmpty){
      ref.watch(moviesStateControllerProvider.notifier).changeState(newValue: true);
    }

    ref.invalidateSelf();
    ref.notifyListeners();

    _isRequestRunning = false;
  }

  Future<void> searchFieldOnChanged({required String query}) async{
    if(query.length < 2) return;

    _query = query;
    _page = 1;

    await getSearchedMovieList();
  }

  void clearSearchSession({required TextEditingController controller}) {
    controller.clear();
    _movies.clear();
    ref.watch(moviesStateControllerProvider.notifier).changeState(newValue: false);

    state = AsyncData(_movies);
  }
}
