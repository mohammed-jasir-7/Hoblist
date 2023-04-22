// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hob_movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HobMovie _$HobMovieFromJson(Map<String, dynamic> json) => HobMovie(
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
      queryParam: json['queryParam'] == null
          ? null
          : QueryParam.fromJson(json['queryParam'] as Map<String, dynamic>),
      code: json['code'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$HobMovieToJson(HobMovie instance) => <String, dynamic>{
      'result': instance.result,
      'queryParam': instance.queryParam,
      'code': instance.code,
      'message': instance.message,
    };
