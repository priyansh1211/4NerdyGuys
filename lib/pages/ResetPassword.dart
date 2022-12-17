import 'package:flutter/material.dart';
import 'package:flutter_app/pages/Auth/LoginPage.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

  bool _showpassword = true;
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
                    padding: EdgeInsets.symmetric(horizontal: 25),
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
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: TextField(
                    obscureText: _showpassword,
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: (){
                          setState(()=>_showpassword=!_showpassword);
                        },
                        child: Icon(
                         _showpassword?Icons.visibility_rounded:Icons.visibility_off_rounded
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide:  BorderSide(color: Colors.black45),
                      ),
                      hintStyle: TextStyle(fontFamily: 'ReadexPro'),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black45),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      hintText: 'New Password',
                      filled: true,
                      fillColor: Color(0xffEEF2FF),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                    },
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: Color(0xff001E6C),
                        borderRadius: BorderRadius.circular(5.0),
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
