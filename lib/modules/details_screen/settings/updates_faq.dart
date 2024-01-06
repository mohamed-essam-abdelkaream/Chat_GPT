import 'package:flutter/material.dart';
import 'package:teqnia/modules/ask_chat_gpt/ask_chat_gpt.dart';
import 'package:teqnia/navigation/navigation.dart';

class Updates extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Image(
          image: AssetImage('assets/images/updates.png'),
          width: 20,
          height: 20,
        ),
        TextButton(
          onPressed: () {
            navigateTo(context, AskChatGpt());
          },
          child: const Text(
            'Updates & FAQ',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
