import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String name;
  String gender;
  GeoPoint location;
  String skill;
  User({
    required this.name,
    required this.gender,
    required this.location,
    required this.skill,
  });
  User.fromJson(Map<String, Object?> json)
      : this(
          name: json['name']! as String,
          gender: json['gender']! as String,
          location: json['location']! as GeoPoint,
          skill: json['skill']! as String,
        );

  User copyWith({
    String? name,
    String? gender,
    GeoPoint? location,
    String? skill,
  }) {
    return User(
      name: name ?? this.name,
      gender: gender ?? this.gender,
      location: location ?? this.location,
      skill: skill ?? this.skill,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'name': name,
      'gender': gender,
      'location': location,
      'skill': skill,
    };
  }
}
