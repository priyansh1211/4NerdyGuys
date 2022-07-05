import 'package:flutter/material.dart';
import 'package:flutter_app/pages/Button.dart';
import 'package:flutter_app/pages/InputField.dart';

class InputWrapper extends StatefulWidget {
  const InputWrapper({Key? key}) : super(key: key);

  @override
  State<InputWrapper> createState() => _InputWrapperState();
}
class _InputWrapperState extends State<InputWrapper>{
Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          SizedBox(height: 40,),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
            ),
            child: InputField(),
          ),
          SizedBox(height: 20,),
           InkWell(
             onTap: (){
               Navigator.pushNamed(context, 'SignUp');
             },
             child: Text("Forgot Password?",style: TextStyle(color: Colors.blue.shade900,fontSize: 20),),
           ),
          SizedBox(height: 20,),
          Button(),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Don\'t have an account?',style: TextStyle(color: Colors.black,fontSize: 20),),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, 'SignUp');
                },
                child: Text('Sign Up',style: TextStyle(color: Colors.blue.shade900,fontSize: 20),),
              )
            ],
          )
        ],
      ),
    );
  }
}
