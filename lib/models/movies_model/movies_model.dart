// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tmbd/models/movie_detail_model/movie_detail_model.dart';

part 'movies_model.freezed.dart';
part 'movies_model.g.dart';

@freezed
class MoviesModel with _$MoviesModel {
  factory MoviesModel({
    int? page,
    int? total_pages,
    int? total_results,
    List<MovieDetailModel>? results
  }) = _MoviesModel;


  factory MoviesModel.fromJson(Map<String, dynamic> json) =>
      _$MoviesModelFromJson(json);
}