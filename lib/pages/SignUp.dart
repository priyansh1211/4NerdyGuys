import 'package:flutter/material.dart';
import 'package:flutter_app/pages/LoginPage.dart';
//import 'package:flutter_app/pages/SignUpInputWrapper.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _showpassword = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
        //backgroundColor: Colors.blue,
        body: ClipRRect(
          child:Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                  Color(0xffBDE6F1),
                  Color(0xffBDE6F1),
                  Color(0xffBDE6F1),
                ]
                )
            ),
            child: Stack(
                //alignment: Alignment.center,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Positioned(
                  top: 22,
                 right: 16,
                 // alignment: Alignment.topRight,
                    child: Image.asset('assets/images/icon.png')
                ),
                Column(
                  children: [
                    Container(
                      width:size.width,
                      height: size.height*0.29875,
                     // color: Colors.blue,
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Color(0xffE5E5E5),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(21),
                                topRight: Radius.circular(21))),
                        child:  ListView(
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
                                    obscureText: _showpassword,
                                    decoration: InputDecoration(
                                      suffixIcon: GestureDetector(
                                        onTap: (){
                                          setState(()=>_showpassword=!_showpassword);
                                        },
                                        child: Icon(
                                            _showpassword?Icons.visibility_sharp:Icons.visibility_off_sharp
                                        ),
                                      ),
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
                Positioned(
                  top: size.height*0.105,
                  left: 92,
                  right: 92,
                  child: Image.asset('assets/images/sign_up.png',height:176,width:176,),
                ),
              ],
            ),
          ),),
    );
  }
}
