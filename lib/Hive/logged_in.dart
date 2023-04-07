
import 'dart:convert';

import 'package:hive/hive.dart';

// part 'logged_in.g.dart';

@HiveType(typeId:0)
class UserDataHive extends HiveObject {
@HiveField(0)
  int? id;
  @HiveField(1)
  String? first_name;
  @HiveField(2)
  String? last_name;
  @HiveField(3)
  String? name;
  @HiveField(4)
  String? email;
  @HiveField(5)
  String? username;
  UserDataHive({
    this.id,
    this.first_name,
    this.last_name,
    this.name,
    this.email,
    this.username,
  });

  UserDataHive copyWith({
    int? id,
    String? first_name,
    String? last_name,
    String? name,
    String? email,
    String? username,
  }) {
    return UserDataHive(
      id: id ?? this.id,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      name: name ?? this.name,
      email: email ?? this.email,
      username: username ?? this.username,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'first_name': first_name,
      'last_name': last_name,
      'name': name,
      'email': email,
      'username': username,
    };
  }

  factory UserDataHive.fromMap(Map<String, dynamic> map) {
    return UserDataHive(
      id: map['id'] != null ? map['id'] as int : null,
      first_name: map['first_name'] != null ? map['first_name'] as String : null,
      last_name: map['last_name'] != null ? map['last_name'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDataHive.fromJson(String source) => UserDataHive.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserDataHive(id: $id, first_name: $first_name, last_name: $last_name, name: $name, email: $email, username: $username)';
  }

  @override
  bool operator ==(covariant UserDataHive other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.first_name == first_name &&
      other.last_name == last_name &&
      other.name == name &&
      other.email == email &&
      other.username == username;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      first_name.hashCode ^
      last_name.hashCode ^
      name.hashCode ^
      email.hashCode ^
      username.hashCode;
  }
}
