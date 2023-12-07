import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tmbd/models/movie_detail_model/movie_detail_model.dart';
import 'package:tmbd/models/movies_model/movies_model.dart';
import 'package:tmbd/services/movies_service/movies_service.dart';

part 'movies_view_model.g.dart';

@riverpod
class MoviesViewModel extends _$MoviesViewModel {
  final List<MovieDetailModel> _movies = [];
  int _page = 1;
  int _totalPage = 1;
  bool _isRequestRunning = false;

  @override
  Future<List<MovieDetailModel>> build({required ScrollController scrollController}) async {
    await getMovieList();

    scrollController.addListener(() async{
      if (!_isRequestRunning && scrollController.position.pixels > 0.8 * scrollController.position.maxScrollExtent) {
        _isRequestRunning = true;
        await getMovieList();
        _isRequestRunning = false;
      }
    });

    return Future.value(_movies);
  }

  Future<void> getMovieList() async {
    if (_page != 1 && _page > _totalPage) return;

    MoviesModel? response = await MoviesService().getMovies(page: _page.toString());

    if (response != null && (response.results?.isNotEmpty ?? false)) {
      _movies.addAll(response.results ?? []);

      _totalPage = response.total_pages ?? 1;
      _page++;

      state = AsyncData(_movies);
    }
  }
}
