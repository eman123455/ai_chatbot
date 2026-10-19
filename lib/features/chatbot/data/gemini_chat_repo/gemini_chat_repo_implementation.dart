import 'package:ai_chatbot/features/chatbot/data/gemini_chat_repo/gemini_chat_repo.dart';
import 'package:ai_chatbot/features/chatbot/data/gemini_chat_service/gemini_chat_service.dart';
import 'package:ai_chatbot/features/chatbot/data/models/chat_message_model/chat_message_model.dart';

class GeminiChatRepoImplementation implements GeminiChatRepo {
  final GeminiChatService _geminiChatService;

  GeminiChatRepoImplementation(this._geminiChatService);

  @override
  Future<ChatMessageModel> sendMessage(List<ChatMessageModel> messages) async {
    return await _geminiChatService.sendMessage(messages);
  }
  
}