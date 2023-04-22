// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryParam _$QueryParamFromJson(Map<String, dynamic> json) => QueryParam(
      category: json['category'] as String?,
      language: json['language'] as String?,
      genre: json['genre'] as String?,
      sort: json['sort'] as String?,
    );

Map<String, dynamic> _$QueryParamToJson(QueryParam instance) =>
    <String, dynamic>{
      'category': instance.category,
      'language': instance.language,
      'genre': instance.genre,
      'sort': instance.sort,
    };
