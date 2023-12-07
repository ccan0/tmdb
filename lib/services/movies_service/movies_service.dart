import 'package:dio/dio.dart';
import 'package:tmbd/models/movie_information_model/movie_information_model.dart';
import 'package:tmbd/models/movies_model/movies_model.dart';
import 'package:tmbd/repositories/movies_repository/movies_repository.dart';

class MoviesService {
  Future<MoviesModel?> getMovies({required String page}) async {
    try {
      Response? response = await MoviesRepository().getMovies(page: page);

      MoviesModel moviesModel = MoviesModel.fromJson(response?.data);

      return moviesModel;
    } on Exception catch (error) {
      print('GETMOVIES request error: $error');

      return null;
    }
  }

  Future<MoviesModel?> getSearchedMovies({required String page, required String query}) async {
    try {
      Response? response = await MoviesRepository().getSearchedMovies(page: page, query: query);

      MoviesModel moviesModel = MoviesModel.fromJson(response?.data);

      return moviesModel;
    } on Exception catch (error) {
      print('GETSEARCHEDMOVIES request error: $error');

      return null;
    }
  }

  Future<MovieInformationModel?> getMovie({required String movieId}) async {
    try {
      Response? response = await MoviesRepository().getMovie(movieId: movieId);

      MovieInformationModel movieModel = MovieInformationModel.fromJson(response?.data);

      return movieModel;
    } on Exception catch (error) {
      print('GETMOVIE request error: $error');

      return null;
    }
  }
}
