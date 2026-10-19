import 'package:ai_chatbot/features/chatbot/data/models/chat_message_model/chat_message_model.dart';
import 'package:flutter/material.dart';

import 'bot_message.dart';
import 'message_bubble.dart';

class Conversation extends StatelessWidget {
  const Conversation({super.key, required this.messages});
  final List<ChatMessageModel> messages;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(18, 10, 18, 4),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        final text = message.parts
                ?.map((part) => part.text ?? '')
                .where((part) => part.isNotEmpty)
                .join('\n') ??
            '';
        final isUser = message.role == 'user';

        return isUser
            ? MessageBubble(text: text, isUser: true)
            : BotMessage(text: text);
      },
    );
  }
}
