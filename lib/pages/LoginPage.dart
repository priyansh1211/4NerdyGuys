import 'package:flutter/material.dart';
import 'package:flutter_app/pages/ForgotPassword.dart';
import 'package:flutter_app/pages/Header.dart';
import 'package:flutter_app/pages/home_page.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ClipRRect(
        child:Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              Colors.white54,
              Colors.white,
            ]
            )
        ),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 250,
            ),
            const Header(),
            Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color(0xffE5E5E5),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60))),
                  child: ListView(
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
                                filled: true,
                                fillColor: Color(0xffEEF2FF),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 45),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=> ForgotPassword()),
                                );
                              },
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                    color: Colors.blue.shade900,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const HomePage()),
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
                              child: Text("Login", style: TextStyle(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Don\'t have an account?',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, 'SignUp');
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(color: Colors.blue.shade900, fontSize: 20),
                            ),
                          )
                        ],
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
