import 'package:json_annotation/json_annotation.dart';

part 'query_param.g.dart';

@JsonSerializable()
class QueryParam {
  String? category;
  String? language;
  String? genre;
  String? sort;

  QueryParam({this.category, this.language, this.genre, this.sort});

  factory QueryParam.fromJson(Map<String, dynamic> json) {
    return _$QueryParamFromJson(json);
  }

  Map<String, dynamic> toJson() => _$QueryParamToJson(this);
}
