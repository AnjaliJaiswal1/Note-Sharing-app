// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

class AllPostsModel {
  int? status;
  String? message;
  List<PostModel>? data;
  AllPostsModel({
    this.status,
    this.message,
    this.data,
  });

  AllPostsModel copyWith({
    int? status,
    String? message,
    List<PostModel>? data,
  }) {
    return AllPostsModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'data': data!.map((x) => x.toMap()).toList(),
    };
  }

  factory AllPostsModel.fromMap(Map<String, dynamic> map) {
    return AllPostsModel(
      status: map['status'] != null ? map['status'] as int : null,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] != null
          ? List<PostModel>.from(
              (map['data']).map<PostModel?>(
                (x) => PostModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AllPostsModel.fromJson(String source) =>
      AllPostsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'AllPostsModel(status: $status, message: $message, data: $data)';

  @override
  bool operator ==(covariant AllPostsModel other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.message == message &&
        listEquals(other.data, data);
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}

class PostModel {
  String? post_file;
  String? post_image;
  int? post_author;
  int? post_id;
  String? post_content;
  PostModel({
    this.post_file,
    this.post_image,
    this.post_author,
    this.post_id,
    this.post_content,
  });

  PostModel copyWith({
    String? post_file,
    String? post_image,
    int? post_author,
    int? post_id,
    String? post_content,
  }) {
    return PostModel(
      post_file: post_file ?? this.post_file,
      post_image: post_image ?? this.post_image,
      post_author: post_author ?? this.post_author,
      post_id: post_id ?? this.post_id,
      post_content: post_content ?? this.post_content,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'post_file': post_file,
      'post_image': post_image,
      'post_author': post_author,
      'post_id': post_id,
      'post_content': post_content,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      post_file: map['post_file'] != null ? map['post_file'] as String : null,
      post_image:
          map['post_image'] != null ? map['post_image'] as String : null,
      post_author:
          map['post_author'] != null ? map['post_author'] as int : null,
      post_id: map['post_id'] != null ? map['post_id'] as int : null,
      post_content:
          map['post_content'] != null ? map['post_content'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PostModel(post_file: $post_file, post_image: $post_image, post_author: $post_author, post_id: $post_id, post_content: $post_content)';
  }

  @override
  bool operator ==(covariant PostModel other) {
    if (identical(this, other)) return true;

    return other.post_file == post_file &&
        other.post_image == post_image &&
        other.post_author == post_author &&
        other.post_id == post_id &&
        other.post_content == post_content;
  }

  @override
  int get hashCode {
    return post_file.hashCode ^
        post_image.hashCode ^
        post_author.hashCode ^
        post_id.hashCode ^
        post_content.hashCode;
  }
}
