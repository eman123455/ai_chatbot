import 'package:flutter/material.dart';

class ChatHeader extends StatelessWidget {
  const ChatHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 14, 14, 12),
      child: Row(
        children: [
          const Icon(Icons.arrow_back_ios_new_rounded, size: 17),
          const SizedBox(width: 23),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ChatGPT',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF18202B),
                  ),
                ),
                SizedBox(height: 2),
                Row(
                  children: [
                    Icon(Icons.circle, size: 7, color: Color(0xFF35B86B)),
                    SizedBox(width: 4),
                    Text(
                      'Online',
                      style: TextStyle(
                        fontSize: 10,
                        color: Color(0xFF35B86B),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Icon(
            Icons.volume_up_outlined,
            size: 18,
            color: Color(0xFF65707D),
          ),
          const SizedBox(width: 12),
          const Icon(Icons.more_horiz, size: 21, color: Color(0xFF65707D)),
        ],
      ),
    );
  }
}
