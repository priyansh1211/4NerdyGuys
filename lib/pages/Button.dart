
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home_page.dart';

class Button extends StatefulWidget {
  const Button({Key? key}) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        },
        child: Container(
          height: 50,
          margin: EdgeInsets.symmetric(horizontal: 45),
          decoration: BoxDecoration(
            color: Colors.blue.shade900,
            borderRadius: BorderRadius.circular(40.0),
          ),
          child: Center(
            child: Text("Login", style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize:20
            ),
            ),
          ),
        )
    );
  }
}
