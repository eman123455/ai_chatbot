import 'package:ai_chatbot/features/chatbot/data/gemini_chat_repo/gemini_chat_repo_implementation.dart';
import 'package:ai_chatbot/features/chatbot/data/gemini_chat_service/gemini_chat_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void serviceLocator() {
  getIt.registerSingleton(GeminiChatRepoImplementation(GeminiChatService()));
}
