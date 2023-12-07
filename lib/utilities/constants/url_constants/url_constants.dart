import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmbd/utilities/constants/color_constants/color_constants.dart';

class UrlConstants {
  static final UrlConstants _instance = UrlConstants._internal();

  factory UrlConstants() {
    return _instance;
  }

  UrlConstants._internal();

  final String baseUrl = "https://api.themoviedb.org/3";
  final String imageBaseUrl = "https://image.tmdb.org/t/p/original/";
  final String apiKey = "7b076625c94975dce5956e9a61f3e033";

  final String getMovies = "/movie/popular";
  final String getSearchedMovies = "/search/movie";
  final String getMovie = "/movie/{movieID}";

}
