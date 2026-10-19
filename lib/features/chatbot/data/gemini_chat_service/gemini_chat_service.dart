
import 'package:ai_chatbot/core/constants/constants.dart';
import 'package:ai_chatbot/core/services/api_service.dart';
import 'package:ai_chatbot/features/chatbot/data/models/chat_message_model/chat_message_model.dart';
import 'package:ai_chatbot/features/chatbot/data/models/gemini_response_model/gemini_response_model.dart';

class GeminiChatService {
  final ApiService _apiService;

  GeminiChatService()
      : _apiService = ApiService(
          baseUrl: Constants.geminiBaseUrl,
        );

  Future<ChatMessageModel> sendMessage(
    List<ChatMessageModel> messages,
  ) async {
    final response = await _apiService.post(
      endpoint:
          '/v1beta/models/gemini-3.5-flash:generateContent',
      data: {
        'contents': messages
            .map((message) => message.toJson())
            .toList(),
      },
      headers: {
        'x-goog-api-key': Constants.geminiApiKey,
        'Content-Type': 'application/json',
      },
    );

    final responseModel = GeminiResponseModel.fromJson(
        response.data,
    );

    return ChatMessageModel(
      role: responseModel.role ?? 'model',
      parts: responseModel.parts,
    );
  }
}
