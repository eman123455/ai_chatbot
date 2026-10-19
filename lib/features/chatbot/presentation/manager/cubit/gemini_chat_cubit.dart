import 'package:ai_chatbot/core/utils/service_locator.dart';
import 'package:ai_chatbot/features/chatbot/data/gemini_chat_repo/gemini_chat_repo_implementation.dart';
import 'package:ai_chatbot/features/chatbot/data/models/chat_message_model/chat_message_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'gemini_chat_state.dart';


class GeminiChatCubit extends Cubit<GeminiChatState> {
  GeminiChatCubit() : super(GeminiChatInitial());

  final geminiChatRepo = getIt<GeminiChatRepoImplementation>();

  final List<ChatMessageModel> messages = [];

  Future<void> sendMessage(String text) async {
    final userMessage = ChatMessageModel.user(text);

    messages.add(userMessage);
    emit(GeminiChatLoading());

    try {
      final response = await geminiChatRepo.sendMessage(messages);

      messages.add(response);
      emit(GeminiChatSuccessful(messages: List.unmodifiable(messages)));
    } catch (e) {
      emit(GeminiChatError(e.toString()));
    }
  }
}
