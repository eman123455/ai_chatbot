
import '../chat_message_model/part.dart';

class GeminiResponseModel {
  final List<Part> parts;
  final String? role;

  GeminiResponseModel({
    this.parts = const [],
    this.role,
  });

  factory GeminiResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    final candidates = json['candidates'] as List<dynamic>? ?? [];

    if (candidates.isEmpty) {
      return GeminiResponseModel();
    }

    final candidate = candidates.first as Map<String, dynamic>;
    final content = candidate['content'] as Map<String, dynamic>?;

    return GeminiResponseModel(
      parts: (content?['parts'] as List<dynamic>? ?? [])
          .map(
            (e) => Part.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      role: content?['role'] as String?,
    );
  }

  String get responseText => parts
      .map((part) => part.text ?? '')
      .where((text) => text.isNotEmpty)
      .join('\n');
}
