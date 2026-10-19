import 'package:ai_chatbot/features/chatbot/data/models/chat_message_model/chat_message_model.dart';

abstract class GeminiChatRepo {
  Future<ChatMessageModel> sendMessage(List<ChatMessageModel> messages);
}
