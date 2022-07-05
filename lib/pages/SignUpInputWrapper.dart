import 'package:flutter/material.dart';
import 'package:flutter_app/pages/Button.dart';
import 'package:flutter_app/pages/InputField.dart';

class SignUpInputWrapper extends StatefulWidget {
  const SignUpInputWrapper({Key? key}) : super(key: key);
  @override
  State<SignUpInputWrapper> createState() => _SignupInputWrapperState();
}


class _SignupInputWrapperState extends State<SignUpInputWrapper>{
  bool valuefirst = false;
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Container(
        child: Column(
          children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(height: 10,),
              Container(
                child: InputField(),
              ),
              Text("Remember me?",style: TextStyle(color: Colors.white,fontSize: 20),),
              Button(),
            ],
          )
        ],),
      ),
    );
  }
}
