import 'package:flutter/material.dart';
import 'package:tmbd/presentation/components/movie_poster_card/movie_poster_card.dart';

class ClickableMoviePosterCard extends StatelessWidget {
  const ClickableMoviePosterCard(
      {super.key, required this.moviePoster, required this.movieName, required this.movieVoteAverage, required this.onTap});

  final String moviePoster;
  final String movieName;
  final String movieVoteAverage;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: MoviePosterCard(
        moviePoster: moviePoster,
        movieName: movieName,
        movieVoteAverage: movieVoteAverage,
      ),
    );
  }
}
