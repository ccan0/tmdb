// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MoviesModelImpl _$$MoviesModelImplFromJson(Map<String, dynamic> json) =>
    _$MoviesModelImpl(
      page: json['page'] as int?,
      total_pages: json['total_pages'] as int?,
      total_results: json['total_results'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => MovieDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MoviesModelImplToJson(_$MoviesModelImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.total_pages,
      'total_results': instance.total_results,
      'results': instance.results,
    };
