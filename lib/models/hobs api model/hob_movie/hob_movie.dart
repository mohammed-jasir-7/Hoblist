import 'package:json_annotation/json_annotation.dart';

import 'query_param.dart';
import 'result.dart';

part 'hob_movie.g.dart';

@JsonSerializable()
class HobMovie {
  List<Result>? result;
  QueryParam? queryParam;
  int? code;
  String? message;

  HobMovie({this.result, this.queryParam, this.code, this.message});

  factory HobMovie.fromJson(Map<String, dynamic> json) {
    return _$HobMovieFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HobMovieToJson(this);
}
