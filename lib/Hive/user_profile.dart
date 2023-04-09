// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';
part 'user_profile.g.dart';

@HiveType(typeId: 1)
class UserProfileDataHive extends HiveObject {
  String? profile_image;
  int? id;
  String? gender;
  String? description;
  String? university;
  String? course;
  String? collegeID;
  int? user;
  int? year;
  UserProfileDataHive({
    this.profile_image,
    this.id,
    this.gender,
    this.description,
    this.university,
    this.course,
    this.collegeID,
    this.user,
    this.year,
  });

  UserProfileDataHive copyWith({
    String? profile_image,
    int? id,
    String? gender,
    String? description,
    String? university,
    String? course,
    String? collegeID,
    int? user,
    int? year,
  }) {
    return UserProfileDataHive(
      profile_image: profile_image ?? this.profile_image,
      id: id ?? this.id,
      gender: gender ?? this.gender,
      description: description ?? this.description,
      university: university ?? this.university,
      course: course ?? this.course,
      collegeID: collegeID ?? this.collegeID,
      user: user ?? this.user,
      year: year ?? this.year,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'profile_image': profile_image,
      'id': id,
      'gender': gender,
      'description': description,
      'university': university,
      'course': course,
      'collegeID': collegeID,
      'user': user,
      'year': year,
    };
  }

  factory UserProfileDataHive.fromMap(Map<String, dynamic> map) {
    return UserProfileDataHive(
      profile_image: map['profile_image'] != null ? map['profile_image'] as String : null,
      id: map['id'] != null ? map['id'] as int : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      university: map['university'] != null ? map['university'] as String : null,
      course: map['course'] != null ? map['course'] as String : null,
      collegeID: map['collegeID'] != null ? map['collegeID'] as String : null,
      user: map['user'] != null ? map['user'] as int : null,
      year: map['year'] != null ? map['year'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfileDataHive.fromJson(String source) => UserProfileDataHive.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserProfileDataHive(profile_image: $profile_image, id: $id, gender: $gender, description: $description, university: $university, course: $course, collegeID: $collegeID, user: $user, year: $year)';
  }

  @override
  bool operator ==(covariant UserProfileDataHive other) {
    if (identical(this, other)) return true;
  
    return 
      other.profile_image == profile_image &&
      other.id == id &&
      other.gender == gender &&
      other.description == description &&
      other.university == university &&
      other.course == course &&
      other.collegeID == collegeID &&
      other.user == user &&
      other.year == year;
  }

  @override
  int get hashCode {
    return profile_image.hashCode ^
      id.hashCode ^
      gender.hashCode ^
      description.hashCode ^
      university.hashCode ^
      course.hashCode ^
      collegeID.hashCode ^
      user.hashCode ^
      year.hashCode;
  }
}
