// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

part 'token.g.dart';

@HiveType(typeId: 2)
class TokenModel extends HiveObject {
  @HiveField(0)
  String? refreshToken;
  @HiveField(1)
  String? accessToken;
  TokenModel({
    this.refreshToken,
    this.accessToken,
  });

  TokenModel copyWith({
    String? refreshToken,
    String? accessToken,
  }) {
    return TokenModel(
      refreshToken: refreshToken ?? this.refreshToken,
      accessToken: accessToken ?? this.accessToken,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'refresh': refreshToken,
      'access': accessToken,
    };
  }

  factory TokenModel.fromMap(Map<String, dynamic> map) {
    return TokenModel(
      refreshToken: map['refresh'] != null ? map['refresh'] as String : null,
      accessToken: map['access'] != null ? map['access'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TokenModel.fromJson(String source) =>
      TokenModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'TokenModel(refresh: $refreshToken, access: $accessToken)';

  @override
  bool operator ==(covariant TokenModel other) {
    if (identical(this, other)) return true;

    return other.refreshToken == refreshToken &&
        other.accessToken == accessToken;
  }

  @override
  int get hashCode => refreshToken.hashCode ^ accessToken.hashCode;
}
