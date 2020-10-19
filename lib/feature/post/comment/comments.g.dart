// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comments _$CommentFromJson(Map<String, dynamic> json) {
  return Comments(
    postId: json['postId'] as int,
    id: json['id'] as int,
    name: json['name'] as String,
    email: json['email'] as String,
    body: json['body'] as String,
  );
}

Map<String, dynamic> _$CommentToJson(Comments instance) => <String, dynamic>{
      'postId': instance.postId,
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'body': instance.body,
    };
