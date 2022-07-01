
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/Header.dart';
import 'package:flutter_app/pages/InputWrapper.dart';
//import 'package:flutter_app/pages/home_page.dart';
//import 'package:form_field_validator/form_field_validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.cyan.shade500,
                  Colors.cyan.shade300,
                  Colors.cyan.shade400
                ]
            )
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 130,),
            Header(),
            Expanded(child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60)
                  )
              ),
              child: InputWrapper(),
            ))
          ],
        ),
      ),
    );
  }
}

