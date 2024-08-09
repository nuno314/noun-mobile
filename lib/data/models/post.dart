import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  final String? id;
  final String? content;
  final String? userId;
  final String? username;
  final String? avatarUrl;
  final int? heartNumber;
  final int? commentNumber;
  final int? quoteNumber;
  final DateTime? createdAt;

  const Post({
    this.avatarUrl,
    this.heartNumber,
    this.commentNumber,
    this.quoteNumber,
    this.id,
    this.content,
    this.userId,
    this.username,
    this.createdAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}
