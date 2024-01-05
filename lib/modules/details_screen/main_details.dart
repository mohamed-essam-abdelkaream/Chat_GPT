import 'package:flutter/material.dart';
import 'package:teqnia/modules/ask_chat_gpt/ask_chat_gpt.dart';
import 'package:teqnia/modules/details_screen/settings/clear_conversation.dart';
import 'package:teqnia/modules/details_screen/settings/light_mode.dart';
import 'package:teqnia/modules/details_screen/settings/logout.dart';
import 'package:teqnia/modules/details_screen/settings/updates_faq.dart';
import 'package:teqnia/modules/details_screen/settings/upgrade_to_plus.dart';

class MainDetails extends StatefulWidget {

  @override
  State<MainDetails> createState() => _MainDetailsState();
}

class _MainDetailsState extends State<MainDetails> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff202123),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Image(
                    image: AssetImage('assets/images/new_chat.png'),
                    width: 15,
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'New chat',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios, size: 15,),
                    onPressed: () async {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => AskChatGpt())
                      );
                    },
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 1,
                decoration: const BoxDecoration(color: Colors.grey),
              ),
              const Spacer(),
              Container(
                width: double.infinity,
                height: 1,
                decoration: const BoxDecoration(color: Colors.grey),
              ),
              Column(
                children: [
                  ClearConversation(),
                  UpgradetoPlus(),
                  LightMode(),
                  Updates(),
                  Logout(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}