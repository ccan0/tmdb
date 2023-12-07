import 'package:dio/dio.dart';
import 'package:tmbd/core/client/app_client.dart';
import 'package:tmbd/utilities/constants/url_constants/url_constants.dart';

class MoviesRepository {
  Future<Response?> getMovies({required String page}) async {
    try {
      Response? response = await AppClient().get(url: UrlConstants().getMovies, queryParameters: {"page": page});

      return response;
    } on Exception catch (error) {
      print('GETMOVIES request error: $error');

      return null;
    }
  }

  Future<Response?> getSearchedMovies({required String page, required String query}) async {
    try {
      Response? response = await AppClient().get(url: UrlConstants().getSearchedMovies, queryParameters: {"page": page, "query": query});

      return response;
    } on Exception catch (error) {
      print('GETSEARCHEDMOVIES request error: $error');

      return null;
    }
  }

  Future<Response?> getMovie({required String movieId}) async {
    try {
      Response? response = await AppClient().get(url: UrlConstants().getMovie.replaceAll("{movieID}", movieId));

      return response;
    } on Exception catch (error) {
      print('GETMOVIE request error: $error');

      return null;
    }
  }
}
