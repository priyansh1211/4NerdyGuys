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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.grey.shade500,
          Colors.white,
        ])),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 110,
            ),
            const Header(),
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60))),
              child: const InputWrapper(),
            )),
          ],
        ),
      ),
    );
  }
}
