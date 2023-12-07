// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tmbd/models/company_model/company_model.dart';
import 'package:tmbd/models/country_model/country_model.dart';
import 'package:tmbd/models/genre_model/genre_model.dart';
import 'package:tmbd/models/language_model/language_model.dart';

part 'movie_information_model.freezed.dart';
part 'movie_information_model.g.dart';

@freezed
class MovieInformationModel with _$MovieInformationModel {
  factory MovieInformationModel({
    bool? adult,
    String? backdrop_path,
    String? belongs_to_collection,
    List<Genre>? genres,
    String? homepage,
    int? id,
    int? revenue,
    int? runtime,
    int? vote_count,
    String? imdb_id,
    String? status,
    String? tagline,
    String? title,
    String? original_language,
    String? original_title,
    String? overview,
    String? poster_path,
    String? release_date,
    List<Company>? production_companies,
    List<Country>? production_countries,
    List<Language>? spoken_languages,
    bool? video,
    double? popularity,
    double? vote_average,
  }) = _MovieInformationModel;

  factory MovieInformationModel.fromJson(Map<String, dynamic> json) => _$MovieInformationModelFromJson(json);
}
