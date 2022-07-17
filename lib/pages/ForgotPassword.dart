import 'package:flutter/material.dart';
import 'package:flutter_app/pages/ResetPassword.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: Color(0xffE5E5E5),
      body: ListView(
        shrinkWrap: true,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 40,top: 40),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image(
                      image: AssetImage('assets/images/forgot_password.png'),
                      height: 227,
                      width: 244,
                      fit: BoxFit.fitHeight),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 42),
                child: Text('Forgot Password?',
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w800,
                        fontSize: 36,
                    fontFamily: 'ReadexPro')
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 27),
                child: const Text('Enter E-mail linked with your account',
                    style: TextStyle(color: Colors.black54,fontSize: 17,
                    fontFamily: 'ReadexPro')),
              ),
              const SizedBox(
                height: 40,
              ),
              //if(!isKeyboard)
              Padding(
                padding: const EdgeInsets.only(left: 45,right: 45),
                child: TextField(
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontFamily: 'ReadexPro'),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(45),
                      borderSide:  BorderSide(color: Colors.lightBlue.shade200),
                    ),
                    suffixIcon: Icon(Icons.email_outlined),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightBlue.shade200),
                      borderRadius: BorderRadius.circular(45),
                    ),
                    hintText: 'E-mail ID',
                    filled: true,
                    fillColor: Color(0xffEEF2FF),
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
                    margin: EdgeInsets.symmetric(horizontal: 70),
                    decoration: BoxDecoration(
                      color: Color(0xff001E6C),
                      borderRadius: BorderRadius.circular(45),
                    ),
                    child: Center(
                      child: Text("Submit", style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize:20,
                        fontFamily: 'ReadexPro',
                      ),
                      ),
                    ),
                  )
              ),
            ],
          ),
        ],
      ),
    );
  }
}
