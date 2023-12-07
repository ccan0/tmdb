import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tmbd/models/movie_information_model/movie_information_model.dart';
import 'package:tmbd/models/movies_model/movies_model.dart';
import 'package:tmbd/repositories/movies_repository/movies_repository.dart';
import 'package:tmbd/services/movies_service/type/movies_service_interface.dart';

class MoviesService implements IMoviesService {
  @override
  Future<MoviesModel?> getMovies({required String page}) async {
    try {
      Response? response = await MoviesRepository().getMovies(page: page);

      MoviesModel moviesModel = MoviesModel.fromJson(response?.data);

      return moviesModel;
    } on Exception catch (error) {
      debugPrint('GETMOVIES request error: $error');

      return null;
    }
  }

  @override
  Future<MoviesModel?> getSearchedMovies({required String page, required String query}) async {
    try {
      Response? response = await MoviesRepository().getSearchedMovies(page: page, query: query);

      MoviesModel moviesModel = MoviesModel.fromJson(response?.data);

      return moviesModel;
    } on Exception catch (error) {
      debugPrint('GETSEARCHEDMOVIES request error: $error');

      return null;
    }
  }

  @override
  Future<MovieInformationModel?> getMovie({required String movieId}) async {
    try {
      Response? response = await MoviesRepository().getMovie(movieId: movieId);

      MovieInformationModel movieModel = MovieInformationModel.fromJson(response?.data);

      return movieModel;
    } on Exception catch (error) {
      debugPrint('GETMOVIE request error: $error');

      return null;
    }
  }
}
