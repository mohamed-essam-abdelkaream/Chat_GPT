import 'package:flutter/material.dart';

Widget onboardingContainerText({required String text}) =>
    Container(
      width: 365,
      height: 62,
      decoration: BoxDecoration(
          color: Colors.blueGrey[100]?.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10)), //
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
            children: [
              TextSpan(text: text),
            ],
          ),
        ),
      ),
    );


Widget onBoardingWelcomeText({String text = 'Welcome to ChatGPT'}) =>
    Text(
      text,
      style: const TextStyle(fontSize: 37,fontFamily: 'Raleway',fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );


Widget onBoardingTopColumn() =>
    Column(
  children: [
    const Center(child: Image(image: AssetImage('assets/images/Vector.png'))),
    const SizedBox(height: 15,),
    onBoardingWelcomeText(),
    const SizedBox(height: 10,),
    const Text('Ask anything, get yout answer',
      style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: 'Raleway'),),
  ],
);
