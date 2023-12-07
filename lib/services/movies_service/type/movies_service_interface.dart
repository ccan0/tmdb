import 'package:tmbd/models/movie_information_model/movie_information_model.dart';
import 'package:tmbd/models/movies_model/movies_model.dart';

abstract class IMoviesService {
  Future<MoviesModel?> getMovies({required String page});
  Future<MoviesModel?> getSearchedMovies({required String page, required String query});
  Future<MovieInformationModel?> getMovie({required String movieId});
}