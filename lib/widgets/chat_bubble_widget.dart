import 'package:chat_app/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatBubbleWidget extends StatelessWidget {
  const ChatBubbleWidget(
      {super.key, required this.message, required this.isCurrentUser});

  final String message;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode;
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 25,
      ),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isCurrentUser ? Colors.green : Colors.grey.shade500,
      ),
      child: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
