import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'modules/onboarding/onboarding.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.dark(),
      ),
      home: OnboardingScreen(),
    );
  }
}