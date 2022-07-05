
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({Key? key}) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
        margin: EdgeInsets.symmetric(horizontal: 45),
        decoration: BoxDecoration(
          color: Colors.blue.shade900,
          borderRadius: BorderRadius.circular(10.0),
        ),
      child: Center(
        child: Text("Login", style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize:20
        ),
        ),
      ),
      );
  }
}
