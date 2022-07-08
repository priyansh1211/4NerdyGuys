import 'package:flutter/material.dart';
import 'package:flutter_app/pages/LoginPage.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      resizeToAvoidBottomInset: false,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.30,
              width: MediaQuery.of(context).size.width*0.6,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(image: AssetImage('assets/images/reset_password.png'),),
              ),
            ),
            SizedBox(height: 30,),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 45),
                child: Text('Reset Password',
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w800,
                        fontSize: 40))),
            const SizedBox(
              height: 40,
            ),
            //if(!isKeyboard)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: const BorderSide(color: Colors.black45),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.deepPurple),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  hintText: 'New Password',
                  filled: true,
                  fillColor: Colors.grey.shade200,
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(padding: EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: const BorderSide(color: Colors.black45),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color:Colors.deepPurple),
                  borderRadius: BorderRadius.circular(40),
                ),
                hintText: 'Confirm New Password',
                filled:true,
                fillColor: Colors.grey.shade200,
              ),
            ),),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
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
