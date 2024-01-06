import 'package:flutter/material.dart';
import 'package:teqnia/modules/ask_chat_gpt/ask_chat_gpt.dart';
import 'package:teqnia/modules/details_screen/settings/light_mode.dart';
import 'package:teqnia/modules/details_screen/settings/logout.dart';
import 'package:teqnia/modules/details_screen/settings/updates_faq.dart';
import 'package:teqnia/modules/details_screen/settings/upgrade_to_plus.dart';

class MainDetails extends StatefulWidget {
  String? history;

  MainDetails(this.history);

  @override
  State<MainDetails> createState() => _MainDetailsState();
}

class _MainDetailsState extends State<MainDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff202123),
        body: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: [
                  Image(
                    image: AssetImage('assets/images/new_chat.png'),
                    width: 15,
                    height: 15,
                  ),
                  Padding(
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
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    ),
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AskChatGpt(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Divider(height: 1,color:Colors.grey),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xff202123),
                    ),
                    child: Column(
                      children: [
                        if (widget.history != null)
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xff202123),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    '${widget.history}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  Divider(height: 1,color:Colors.grey),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              Spacer(),
              Divider(height: 1,color:Colors.grey),
              Column(
                children: [
                  Row(
                    children: [
                      const Image(
                        image: AssetImage('assets/images/clear.png'),
                        width: 20,
                        height: 20,
                      ),
                      TextButton(
                        onPressed: () {
                          setState(
                            () {
                              widget.history = '';
                            },
                          );
                        },
                        child: const Text(
                          'Clear conversation',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
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
