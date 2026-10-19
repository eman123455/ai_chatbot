import 'package:ai_chatbot/features/chatbot/data/models/chat_message_model/chat_message_model.dart';
import 'package:ai_chatbot/features/chatbot/presentation/manager/cubit/gemini_chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/chat_header.dart';
import '../widgets/conversation.dart';
import '../widgets/chat_input_bar.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  final List<ChatMessageModel> messages = [];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GeminiChatCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 430),
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFEFC),
                  borderRadius: BorderRadius.circular(28),
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    ChatHeader(),
                    Expanded(
                      child:  BlocBuilder<
                          GeminiChatCubit, GeminiChatState>(
                        builder: (context, state) {
                          final messages = context
                              .read<GeminiChatCubit>()
                              .messages;

                          return Conversation(messages: messages);
                        },
                      ),
                    ),
                    ChatInputBar(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
