import 'package:flutter/material.dart';
import 'package:flutter_app/pages/LoginPage.dart';
//import 'package:flutter_app/pages/SignUpInputWrapper.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: Colors.blue,
        body: Form(
          child:Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                  Colors.white,
                  Colors.white,
                ]
                )
            ),
            child: Column(
              children: <Widget>[
                Expanded(child: Image.asset(fit: BoxFit.fitWidth,'assets/images/sign_up.png')),
                Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.29875),
                      //padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.29875),
                      height: MediaQuery.of(context).size.height*0.70125,
                      decoration: const BoxDecoration(
                          color: Color(0xffE5E5E5),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(21),
                              topRight: Radius.circular(21))),
                      child:  Column(
                          children: <Widget>[
                            const SizedBox(
                              height: 100,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 40,right: 40),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(40),
                                          borderSide: BorderSide(color: Color(0xffEEF2FF)),
                                        ),
                                        hintStyle: TextStyle(fontFamily: 'ReadexPro'),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(color: Color(0xffEEF2FF)),
                                          borderRadius: BorderRadius.circular(40),
                                        ),
                                        hintText: 'Name',
                                        filled: true,
                                        fillColor: Color(0xffEEF2FF),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 40,right: 40),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(40),
                                          borderSide: BorderSide(color: Color(0xffEEF2FF)),
                                        ),
                                        hintStyle: TextStyle(fontFamily: 'ReadexPro'),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(color: Color(0xffEEF2FF)),
                                          borderRadius: BorderRadius.circular(40),
                                        ),
                                        hintText: 'E-mail',
                                        filled: true,
                                        fillColor: Color(0xffEEF2FF),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 40,right: 40),
                                    child: TextField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(40),
                                          borderSide: BorderSide(color: Color(0xffEEF2FF)),
                                        ),
                                        hintStyle: TextStyle(fontFamily: 'ReadexPro'),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(color: Color(0xffEEF2FF)),
                                          borderRadius: BorderRadius.circular(40),
                                        ),
                                        hintText: 'Password',
                                        suffixIcon: Icon(Icons.remove_red_eye),
                                        filled: true,
                                        fillColor: Color(0xffEEF2FF),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 40,right: 40),
                                    child: TextField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(40),
                                          borderSide: const BorderSide(color: Color(0xffEEF2FF)),
                                        ),
                                        hintStyle: TextStyle(fontFamily: 'ReadexPro'),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(color: Color(0xffEEF2FF)),
                                          borderRadius: BorderRadius.circular(40),
                                        ),
                                        hintText: 'Designation',
                                        filled: true,
                                        fillColor: Color(0xffEEF2FF),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
                              margin: const EdgeInsets.symmetric(horizontal: 45),
                              decoration: BoxDecoration(
                                color: Color(0xff001E6C),
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              child: const Center(
                                child: Text("SignUp", style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize:20,
                                  fontFamily: 'ReadexPro'
                                ),
                                ),
                              ),
                            )
                        ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                    ),
                    ),
              ],
            ),
          ),),
    );
  }
}
