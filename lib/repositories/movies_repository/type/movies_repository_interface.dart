import 'package:dio/dio.dart';

abstract class IMoviesRepository {
  Future<Response?> getMovies({required String page});
  Future<Response?> getSearchedMovies({required String page, required String query});
  Future<Response?> getMovie({required String movieId});
}