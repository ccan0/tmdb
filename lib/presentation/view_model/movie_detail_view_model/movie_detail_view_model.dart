import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tmbd/models/movie_information_model/movie_information_model.dart';
import 'package:tmbd/services/movies_service/movies_service.dart';

part 'movie_detail_view_model.g.dart';

@riverpod
class MovieDetailViewModel extends _$MovieDetailViewModel {
  MovieInformationModel movieInformation = MovieInformationModel();

  @override
  MovieInformationModel build() {

    return movieInformation;
  }

  Future<void> getMovie({required String movieId}) async {

    MovieInformationModel? response = await MoviesService().getMovie(movieId: movieId);

    if (response != null) {
      movieInformation = response;

      state = movieInformation;

      ref.invalidateSelf();
    }
  }
}
