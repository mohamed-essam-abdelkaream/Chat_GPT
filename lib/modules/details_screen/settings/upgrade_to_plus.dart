import 'package:flutter/material.dart';

class UpgradetoPlus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Image(
          image: AssetImage('assets/images/person.png'),
          width: 20,
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            'Upgrade to plus',
            style: TextStyle(
                fontSize: 16,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold),
          ),
        ),
        const Spacer(),
        Container(
          width: 46,
          height: 20,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Color(0xffFBF3AD)),
          child: const Center(
            child: Text(
              'NEW',
              style: TextStyle(
                  fontSize: 13,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        )
      ],
    );
  }
}
