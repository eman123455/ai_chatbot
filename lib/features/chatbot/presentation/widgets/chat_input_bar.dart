import 'package:ai_chatbot/features/chatbot/presentation/manager/cubit/gemini_chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatInputBar extends StatefulWidget {
  const ChatInputBar({super.key});

  @override
  State<ChatInputBar> createState() => _ChatInputBarState();
}

class _ChatInputBarState extends State<ChatInputBar> {
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(17, 6, 17, 13),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _messageController,
                  decoration: const InputDecoration(
                    hintText: 'Write your message',
                    border: InputBorder.none,
                  ),
                  onSubmitted: (_) => _sendMessage(),
                ),
              ),
              const Icon(
                Icons.add_circle_outline,
                size: 19,
                color: Color(0xFF9AA3AE),
              ),
              const SizedBox(width: 12),
              IconButton(
                onPressed: _sendMessage,
                icon: const Icon(
                  Icons.send_rounded,
                  size: 19,
                  color: Color(0xFF3169F5),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            width: 42,
            height: 3,
            decoration: BoxDecoration(
              color: const Color(0xFFE0E2E5),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    
    
      final text = _messageController.text.trim();

      if (text.isEmpty) return;

      context.read<GeminiChatCubit>().sendMessage(text);

      _messageController.clear();
    
  }
}
