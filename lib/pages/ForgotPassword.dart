import 'package:flutter/material.dart';
import 'package:flutter_app/pages/ResetPassword.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  //final isKeyboard = MediaQuery.of(context).viewInsets.bottom!=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      resizeToAvoidBottomInset: false,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250,
              margin: EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(image: AssetImage('assets/images/forgot_password.png'),),
              ),
            ),
        SizedBox(height: 30,),
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 45),
            child: Text('Forgot Password?',
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w800,
                    fontSize: 40))),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: const Text('Enter E-mail linked with your account',
              style: TextStyle(color: Colors.black54, fontSize: 18)),
        ),
        const SizedBox(
          height: 40,
        ),
        //if(!isKeyboard)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: const BorderSide(color: Colors.black45),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(40),
              ),
              hintText: 'E-mail ID',
              filled: true,
              fillColor: Colors.grey.shade200,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        MaterialButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ResetPassword()),
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
              child: Text("Submit", style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize:20
              ),
              ),
            ),
          )
        )
      ]),
    );
  }
}
