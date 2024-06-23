import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class Message {
  String text;
  Timestamp time;

  Message({
    required this.text,
    required this.time,
  });

  Message.fromJson(Map<String, Object?> json)
      : this(
          text: json['text']! as String,
          time: json['time']! as Timestamp,
        );

  Message copyWith({
    String? text,
    Timestamp? time,
  }) {
    return Message(
      text: text ?? this.text,
      time: time ?? this.time,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'text': text,
      'time': time,
    };
  }
}
