import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String name;
  String gender;
  GeoPoint location;
  String skill;
  String email; // Added email variable

  User({
    required this.name,
    required this.gender,
    required this.location,
    required this.skill,
    required this.email, // Added email parameter
  });

  User.fromJson(Map<String, Object?> json)
      : this(
          name: json['name']! as String,
          gender: json['gender']! as String,
          location: json['location']! as GeoPoint,
          skill: json['skill']! as String,
          email: json['email']! as String, // Added email assignment
        );

  User copyWith({
    String? name,
    String? gender,
    GeoPoint? location,
    String? skill,
    String? email, // Added email parameter
  }) {
    return User(
      name: name ?? this.name,
      gender: gender ?? this.gender,
      location: location ?? this.location,
      skill: skill ?? this.skill,
      email: email ?? this.email, // Added email assignment
    );
  }

  Map<String, Object?> toJson() {
    return {
      'name': name,
      'gender': gender,
      'location': location,
      'skill': skill,
      'email': email, // Added email field
    };
  }
}