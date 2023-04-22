// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      id: json['_id'] as String?,
      description: json['description'] as String?,
      director: (json['director'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      writers:
          (json['writers'] as List<dynamic>?)?.map((e) => e as String).toList(),
      stars:
          (json['stars'] as List<dynamic>?)?.map((e) => e as String).toList(),
      productionCompany: (json['productionCompany'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      pageViews: json['pageViews'] as int?,
      upVoted: json['upVoted'] as List<dynamic>?,
      downVoted: json['downVoted'] as List<dynamic>?,
      title: json['title'] as String?,
      language: json['language'] as String?,
      runTime: json['runTime'],
      releasedDate: json['releasedDate'] as int?,
      genre: json['genre'] as String?,
      voted: (json['voted'] as List<dynamic>?)
          ?.map((e) => Voted.fromJson(e as Map<String, dynamic>))
          .toList(),
      poster: json['poster'] as String?,
      totalVoted: json['totalVoted'] as int?,
      voting: json['voting'] as int?,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      '_id': instance.id,
      'description': instance.description,
      'director': instance.director,
      'writers': instance.writers,
      'stars': instance.stars,
      'productionCompany': instance.productionCompany,
      'pageViews': instance.pageViews,
      'upVoted': instance.upVoted,
      'downVoted': instance.downVoted,
      'title': instance.title,
      'language': instance.language,
      'runTime': instance.runTime,
      'releasedDate': instance.releasedDate,
      'genre': instance.genre,
      'voted': instance.voted,
      'poster': instance.poster,
      'totalVoted': instance.totalVoted,
      'voting': instance.voting,
    };
