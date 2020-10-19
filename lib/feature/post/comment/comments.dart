import 'package:json_annotation/json_annotation.dart';

part 'comments.g.dart';

@JsonSerializable()
class Comments {
  @JsonKey(name: 'postId')
  int postId;
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'email')
  String email;
  @JsonKey(name: 'body')
  String body;

  Comments({this.postId, this.id, this.name, this.email, this.body});

  factory Comments.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
