import 'dart:io';
import 'package:flutter/material.dart';

class Logout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Image(
          image: AssetImage('assets/images/logout.png'),
          width: 20,
          height: 20,
          color: Color(0xffED8C8C),
        ),
        TextButton(
          onPressed: () {
            exit(0);
          },
          child: const Text(
            'Logout',
            style: TextStyle(
                color: Color(0xffED8C8C),
                fontSize: 16,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
