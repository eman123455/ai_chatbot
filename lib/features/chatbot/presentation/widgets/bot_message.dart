import 'package:flutter/material.dart';

class BotMessage extends StatelessWidget {
  final String text;

  const BotMessage({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 1),
            child: Icon(
              Icons.auto_awesome,
              size: 20,
              color: Color(0xFF2464ED),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF68717B),
                fontSize: 20,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
