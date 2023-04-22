import 'package:json_annotation/json_annotation.dart';

import 'voted.dart';

part 'result.g.dart';

@JsonSerializable()
class Result {
  @JsonKey(name: '_id')
  String? id;
  String? description;
  List<String>? director;
  List<String>? writers;
  List<String>? stars;
  List<String>? productionCompany;
  int? pageViews;
  List<dynamic>? upVoted;
  List<dynamic>? downVoted;
  String? title;
  String? language;
  dynamic runTime;
  int? releasedDate;
  String? genre;
  List<Voted>? voted;
  String? poster;
  int? totalVoted;
  int? voting;

  Result({
    this.id,
    this.description,
    this.director,
    this.writers,
    this.stars,
    this.productionCompany,
    this.pageViews,
    this.upVoted,
    this.downVoted,
    this.title,
    this.language,
    this.runTime,
    this.releasedDate,
    this.genre,
    this.voted,
    this.poster,
    this.totalVoted,
    this.voting,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return _$ResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
