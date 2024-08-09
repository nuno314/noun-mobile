// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      avatarUrl: json['avatarUrl'] as String?,
      heartNumber: (json['heartNumber'] as num?)?.toInt(),
      commentNumber: (json['commentNumber'] as num?)?.toInt(),
      quoteNumber: (json['quoteNumber'] as num?)?.toInt(),
      id: json['id'] as String?,
      content: json['content'] as String?,
      userId: json['userId'] as String?,
      username: json['username'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'userId': instance.userId,
      'username': instance.username,
      'avatarUrl': instance.avatarUrl,
      'heartNumber': instance.heartNumber,
      'commentNumber': instance.commentNumber,
      'quoteNumber': instance.quoteNumber,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
