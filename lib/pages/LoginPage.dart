//import 'dart:convert';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/Modules/api.dart';
import 'package:flutter_app/pages/ForgotPassword.dart';
import 'package:flutter_app/pages/OTP.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final URL = "http://localhost:5000/user";
  // TextEditingController _userEmailCtrler = new TextEditingController();
  // TextEditingController _passwordCtrler = new TextEditingController();
  bool _obsecuretext = true;
  final scaffoldkey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  // Future save() async {
  //   final response = await post(Uri.parse("${URL}/login"),
  //       headers: <String, String>{
  //         'Context-Type': 'application/json;charSet=UTF-8'
  //       },
  //       body: <String, String>{
  //         'email': user.email,
  //         'password': user.password
  //       });
  //   print(response.body);
  //   Navigator.push(
  //       context, new MaterialPageRoute(builder: (context) => OTP()));
  // }
  //
  User user = User('', '');
  // Map map2=new Map<String,dynamic>();
  @override
  Widget build(BuildContext context) {
    // final isKeyboard = MediaQuery.of(context).viewInsets.bottom!=0;
    return Scaffold(
        key: scaffoldkey,
        body: Stack(
          children: [
            ListView(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      gradient:
                          LinearGradient(begin: Alignment.topCenter, colors: [
                    Colors.white54,
                    Colors.white,
                  ])),
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: Image.asset('assets/images/login_page_pic.jpeg'),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height *
                                    0.29875),
                            //padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.29875),
                            height:
                                MediaQuery.of(context).size.height * 0.70125,
                            decoration: const BoxDecoration(
                                color: Color(0xffE5E5E5),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(21),
                                    topRight: Radius.circular(21))),
                            child: Form(
                              key: globalFormKey,
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
                                        padding: const EdgeInsets.only(
                                            left: 30, right: 30),
                                        child: TextFormField(
                                          controller: TextEditingController(text: user.email),
                                          onChanged: (value) {
                                            user.email = value;
                                          },
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Enter something';
                                            } else if (RegExp(
                                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                .hasMatch(value)) {
                                              return null;
                                            } else {
                                              return 'Enter valid email';
                                            }
                                          },
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Color(0xffEEF2FF)),
                                            ),
                                            hintStyle: const TextStyle(
                                                fontFamily: 'ReadexPro'),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Color(0xffEEF2FF)),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            hintText: 'E-mail',
                                            filled: true,
                                            fillColor: const Color(0xffEEF2FF),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 30, right: 30),
                                        child: TextFormField(
                                          controller: TextEditingController(text: user.password),
                                          onChanged: (value) {
                                            user.password = value;
                                          },
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Enter something';
                                            }
                                            return null;
                                          },
                                         // obscureText: true,
                                          obscureText: _obsecuretext,
                                          decoration: InputDecoration(
                                            suffixIcon: GestureDetector(
                                              onTap: () {
                                                setState(() => _obsecuretext =
                                                    !_obsecuretext);
                                              },
                                              child: Icon(_obsecuretext
                                                  ? Icons.visibility
                                                  : Icons.visibility_off),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Color(0xffEEF2FF)),
                                            ),
                                            hintStyle: const TextStyle(
                                                fontFamily: 'ReadexPro'),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Color(0xffEEF2FF)),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            hintText: 'Password',
                                            filled: true,
                                            fillColor: const Color(0xffEEF2FF),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 30),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const ForgotPassword()),
                                            );
                                          },
                                          child: Text(
                                            'Forgot Password?',
                                            style: TextStyle(
                                                color: Colors.blue.shade900,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'ReadexPro'),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  MaterialButton(
                                    onPressed: () {
                                     Navigator.push(context, MaterialPageRoute(builder: (context)=>OTP()));
                                     },
                                      // onPressed: () async {
                                      //   Api api = new Api();
                                      //   Map map = new Map<String, dynamic>();
                                      //   map['password'] =
                                      //       _passwordCtrler.toString();
                                      //   map['email'] =
                                      //       _userEmailCtrler.toString();
                                      //   var err;
                                      //   print("error =======>$err");
                                      //   if (_userEmailCtrler
                                      //           .toString()
                                      //           .isNotEmpty &&
                                      //       _passwordCtrler
                                      //           .toString()
                                      //           .isNotEmpty) {
                                      //     Map response = await api.loginApi(map)
                                      //         as Map<String, dynamic>;
                                      //     () {
                                      //       return response;
                                      //     };
                                      //     SharedPreferences? preferences =
                                      //         await SharedPreferences
                                      //             .getInstance();
                                      //     print(
                                      //         "REQUEST: ====================> " +
                                      //             response.toString());
                                      //     setState(() {
                                      //       if (response["status"] ==
                                      //           "success") {
                                      //         preferences.setString("E-mail",
                                      //             _userEmailCtrler.text);
                                      //         Navigator.push(
                                      //           context,
                                      //           MaterialPageRoute(
                                      //               builder: (context) =>
                                      //                   const OTP()),
                                      //         );
                                      //       }
                                      //     });
                                      //   }
                                      // },
                                      child: Container(
                                        height: 55,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        decoration: BoxDecoration(
                                          color: const Color(0xff001E6C),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            "Login",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                fontFamily: 'ReadexPro'),
                                          ),
                                        ),
                                      )),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      const Text(
                                        'Don\'t have an account?',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontFamily: 'ReadexPro'),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, 'SignUp');
                                        },
                                        child: Text(
                                          'Sign Up',
                                          style: TextStyle(
                                              color: Colors.blue.shade900,
                                              fontSize: 20,
                                              fontFamily: 'ReadexPro'),
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
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }


}

class User {
  String email;
  String password;
  User(this.email,this.password);
}
