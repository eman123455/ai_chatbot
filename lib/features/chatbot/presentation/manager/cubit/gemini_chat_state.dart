
part of 'gemini_chat_cubit.dart';

@immutable
sealed class GeminiChatState {}

final class GeminiChatInitial extends GeminiChatState {}

final class GeminiChatSuccessful extends GeminiChatState {
  final List<ChatMessageModel> messages;

  GeminiChatSuccessful({required this.messages});
}

final class GeminiChatError extends GeminiChatState {
  final String errorMessage;

  GeminiChatError(this.errorMessage);
}

final class GeminiChatLoading extends GeminiChatState {}
