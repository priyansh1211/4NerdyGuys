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
      backgroundColor: Color(0xffE5E5E5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffE5E5E5),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body:ListView(
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 40,top: 40),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image(
                        image: AssetImage('assets/images/reset_password.png'),
                        height: 220.8,
                        width: 244,
                        fit: BoxFit.fitHeight),
                  ),
                ),
                SizedBox(height: 10,),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 45),
                    child: Text('Reset Password',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'ReadexPro',
                            fontSize: 45))),
                const SizedBox(
                  height: 30,
                ),
                //if(!isKeyboard)
                Padding(
                  padding: const EdgeInsets.only(left: 40,right: 40),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: const BorderSide(color: Colors.black45),
                      ),
                      hintStyle: TextStyle(fontFamily: 'ReadexPro'),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      hintText: 'New Password',
                      filled: true,
                      fillColor: Color(0xffEEF2FF),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(padding: EdgeInsets.only(left: 40,right: 40),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: const BorderSide(color: Colors.black45),
                      ),
                      hintStyle: TextStyle(fontFamily: 'ReadexPro'),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color:Colors.deepPurple),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      hintText: 'Confirm New Password',
                      filled:true,
                      fillColor: Color(0xffEEF2FF),
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
                      margin: EdgeInsets.symmetric(horizontal: 70),
                      decoration: BoxDecoration(
                        color: Color(0xff001E6C),
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Center(
                        child: Text("Submit", style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize:20,
                          fontFamily: 'ReadexPro'
                        ),
                        ),
                      ),
                    )
                )
              ]),
        ],
      ),
    );
  }
}
