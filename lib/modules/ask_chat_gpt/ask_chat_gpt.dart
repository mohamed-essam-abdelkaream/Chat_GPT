import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:teqnia/modules/details_screen/main_details.dart';
import '../../constants/strings.dart';

class AskChatGpt extends StatefulWidget {
  @override
  _ChatGPTScreenState createState() => _ChatGPTScreenState();
}

class _ChatGPTScreenState extends State<AskChatGpt> {
  final List<Message> _messages = [];
  final TextEditingController _textEditingController = TextEditingController();
  bool _isLoading = false;

  void onSendMessage() async {
    Message message = Message(text: _textEditingController.text, isMe: true);
    _textEditingController.clear();
    setState(() {
      _messages.insert(0, message);
      _isLoading = true; // Set loading state to true
    });

    String response = await sendMessageToChatGpt(message.text);

    Message chatGpt = Message(text: response, isMe: false);

    setState(() {
      _messages.insert(0, chatGpt);
      _isLoading = false; // Set loading state to false
    });
  }

  Future<String> sendMessageToChatGpt(String message) async {
    Uri uri = Uri.parse("https://api.openai.com/v1/chat/completions");

    Map<String, dynamic> body = {
      "model": "gpt-3.5-turbo",
      "messages": [{"role": "user", "content": message}],
      "max_tokens": 500,
    };

    final response = await http.post(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${APIKey.apiKey}",
      },
      body: json.encode(body),
    );

    print(response.body);

    Map<String, dynamic> parsedReponse = json.decode(response.body);

    String reply = parsedReponse['choices'][0]['message']['content'];

    return reply;
  }

  Widget _buildMessage(Message message) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              message.isMe ? 'You' : 'GPT',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(message.text),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff343541),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 10, right: 15),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_outlined, size: 15),
                    onPressed: () {
                      Navigator.pop(context,MainDetails()); //Return messages to previous screen
                    },
                  ),
                  const Text(
                    'Back',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  const Image(
                    image: AssetImage('assets/images/Vector.png'),
                    width: 20,
                    height: 20,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 1,
              decoration: const BoxDecoration(color: Colors.grey),
            ),
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildMessage(_messages[index]);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12.0, left: 12, bottom: 20),
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _textEditingController,
                        decoration: InputDecoration(
                          suffixIcon: _isLoading
                              ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(
                              3,
                                  (index) => Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  width: 8,
                                  height: 8,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                              : GestureDetector(
                            onTap: onSendMessage,
                            child: const Image(
                              image:
                              AssetImage('assets/images/send.png'),
                            ),
                          ),
                          contentPadding: EdgeInsets.all(10.0),
                          hintText: 'Type a message...',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Message {
  final String text;
  final bool isMe;

  Message({required this.text, required this.isMe});
}