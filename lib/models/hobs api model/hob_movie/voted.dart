import 'package:json_annotation/json_annotation.dart';

part 'voted.g.dart';

@JsonSerializable()
class Voted {
  List<dynamic>? upVoted;
  List<dynamic>? downVoted;
  @JsonKey(name: '_id')
  String? id;
  String? genre;
  int? updatedAt;

  Voted({
    this.upVoted,
    this.downVoted,
    this.id,
    this.genre,
    this.updatedAt,
  });

  factory Voted.fromJson(Map<String, dynamic> json) => _$VotedFromJson(json);

  Map<String, dynamic> toJson() => _$VotedToJson(this);
}
