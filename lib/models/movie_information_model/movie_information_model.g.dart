// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_information_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieInformationModelImpl _$$MovieInformationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MovieInformationModelImpl(
      adult: json['adult'] as bool?,
      backdrop_path: json['backdrop_path'] as String?,
      belongs_to_collection: json['belongs_to_collection'] as String?,
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      homepage: json['homepage'] as String?,
      id: json['id'] as int?,
      revenue: json['revenue'] as int?,
      runtime: json['runtime'] as int?,
      vote_count: json['vote_count'] as int?,
      imdb_id: json['imdb_id'] as String?,
      status: json['status'] as String?,
      tagline: json['tagline'] as String?,
      title: json['title'] as String?,
      original_language: json['original_language'] as String?,
      original_title: json['original_title'] as String?,
      overview: json['overview'] as String?,
      poster_path: json['poster_path'] as String?,
      release_date: json['release_date'] as String?,
      production_companies: (json['production_companies'] as List<dynamic>?)
          ?.map((e) => Company.fromJson(e as Map<String, dynamic>))
          .toList(),
      production_countries: (json['production_countries'] as List<dynamic>?)
          ?.map((e) => Country.fromJson(e as Map<String, dynamic>))
          .toList(),
      spoken_languages: (json['spoken_languages'] as List<dynamic>?)
          ?.map((e) => Language.fromJson(e as Map<String, dynamic>))
          .toList(),
      video: json['video'] as bool?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      vote_average: (json['vote_average'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$MovieInformationModelImplToJson(
        _$MovieInformationModelImpl instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdrop_path,
      'belongs_to_collection': instance.belongs_to_collection,
      'genres': instance.genres,
      'homepage': instance.homepage,
      'id': instance.id,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'vote_count': instance.vote_count,
      'imdb_id': instance.imdb_id,
      'status': instance.status,
      'tagline': instance.tagline,
      'title': instance.title,
      'original_language': instance.original_language,
      'original_title': instance.original_title,
      'overview': instance.overview,
      'poster_path': instance.poster_path,
      'release_date': instance.release_date,
      'production_companies': instance.production_companies,
      'production_countries': instance.production_countries,
      'spoken_languages': instance.spoken_languages,
      'video': instance.video,
      'popularity': instance.popularity,
      'vote_average': instance.vote_average,
    };
