import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LightMode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Image(
          image: AssetImage('assets/images/sun.png'),
          width: 20,
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            'Light mode',
            style: TextStyle(
                fontSize: 16,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
