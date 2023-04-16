// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// class CreateUserResponse {
//   String? access;
//   String? refresh;
//   CreateUserResponse({required this.access, required this.refresh});

//   CreateUserResponse.fromMap(Map<String, dynamic> map) {
//     access = map["access"];
//     refresh = map["refresh"];
//   }
// }

class UserData {
  int? id;
  String? firstName;
  String? lastName;
  String? name;
  String? email;
  String? username;
  UserData({
    this.id,
    this.firstName,
    this.lastName,
    this.name,
    this.email,
    this.username,
  });

  UserData copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? name,
    String? email,
    String? username,
  }) {
    return UserData(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      name: name ?? this.name,
      email: email ?? this.email,
      username: username ?? this.username,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'name': name,
      'email': email,
      'username': username,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      id: map['id'] != null ? map['id'] as int : null,
      firstName: map['first_name'] != null ? map['first_name'] as String : null,
      lastName: map['last_name'] != null ? map['last_name'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
    );
  }
}
