import 'package:flutter/material.dart';

class ChatLayer extends StatelessWidget {
  final String message;
  final bool isCurrentUser;


  const ChatLayer({
    super.key,
    required this.message,
    required this.isCurrentUser

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
      decoration: BoxDecoration(
        color: isCurrentUser ? Colors.blue.shade200 : Colors.grey.shade400,
            borderRadius: BorderRadius.circular(15)
      ),
      child: Padding(

        padding: const EdgeInsets.all(12),
        child: Text(message,style: TextStyle(fontSize: 18,)),
      ),
    );
  }
}
