// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voted.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Voted _$VotedFromJson(Map<String, dynamic> json) => Voted(
      upVoted: json['upVoted'] as List<dynamic>?,
      downVoted: json['downVoted'] as List<dynamic>?,
      id: json['_id'] as String?,
      genre: json['genre'] as String?,
      updatedAt: json['updatedAt'] as int?,
    );

Map<String, dynamic> _$VotedToJson(Voted instance) => <String, dynamic>{
      'upVoted': instance.upVoted,
      'downVoted': instance.downVoted,
      '_id': instance.id,
      'genre': instance.genre,
      'updatedAt': instance.updatedAt,
    };
