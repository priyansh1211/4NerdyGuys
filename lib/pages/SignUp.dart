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
        body: ClipRRect(
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
                const SizedBox(
                  height: 250,
                ),
                Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color(0xffE5E5E5),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(60),
                              topRight: Radius.circular(60))),
                      child:  ListView(
                          shrinkWrap: true,
                          children: <Widget>[
                            const SizedBox(
                              height: 40,
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
                                          borderSide: const BorderSide(color: Colors.black45),
                                        ),
                                        hintStyle: TextStyle(fontFamily: 'ReadexPro'),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(color: Colors.deepPurple),
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
                                          borderSide: const BorderSide(color: Colors.black45),
                                        ),
                                        hintStyle: TextStyle(fontFamily: 'ReadexPro'),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(color: Colors.deepPurple),
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
                                          borderSide: const BorderSide(color: Colors.black45),
                                        ),
                                        hintStyle: TextStyle(fontFamily: 'ReadexPro'),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(color: Colors.deepPurple),
                                          borderRadius: BorderRadius.circular(40),
                                        ),
                                        hintText: 'Password',
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
                                          borderSide: const BorderSide(color: Colors.black45),
                                        ),
                                        hintStyle: TextStyle(fontFamily: 'ReadexPro'),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(color: Colors.deepPurple),
                                          borderRadius: BorderRadius.circular(40),
                                        ),
                                        hintText: 'Confirm Password',
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
          ),)
    );
  }
}
