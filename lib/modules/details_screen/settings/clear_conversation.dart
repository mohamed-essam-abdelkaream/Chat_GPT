import 'package:flutter/material.dart';

class ClearConversation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Image(
          image: AssetImage('assets/images/clear.png'),
          width: 20,
          height: 20,
        ),
        TextButton(onPressed: (){

        }, child: const Text('Clear conversation',style: TextStyle(
            fontSize: 16,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,color: Colors.white),)),
      ],
    );
  }
}
