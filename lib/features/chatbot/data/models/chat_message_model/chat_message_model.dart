import 'part.dart';

class ChatMessageModel {
  List<Part>? parts;
  String? role;

  ChatMessageModel({this.parts, this.role});

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      parts: (json['parts'] as List<dynamic>?)
          ?.map((e) => Part.fromJson(e as Map<String, dynamic>))
          .toList(),
      role: json['role'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'parts': parts?.map((e) => e.toJson()).toList(),
    'role': role,
  };
}
