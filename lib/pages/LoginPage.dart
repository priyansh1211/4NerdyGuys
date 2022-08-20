import 'package:flutter/material.dart';
import 'package:flutter_app/pages/ForgotPassword.dart';
import 'package:flutter_app/pages/home_page.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
 // Size size = MediaQuery.of(context).size;
  bool _obsecuretext = true;
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
            Stack(
              children: [
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Image.asset('assets/images/login_page_pic.jpeg'),
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.29875),
                    //padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.29875),
                    height: MediaQuery.of(context).size.height*0.70125,
                    decoration: const BoxDecoration(
                        color: Color(0xffE5E5E5),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(21),
                            topRight: Radius.circular(21))),
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
                              padding: const EdgeInsets.only(left: 30,right: 30),
                              child: TextField(
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Color(0xffEEF2FF)),
                                  ),
                                  hintStyle: TextStyle(fontFamily: 'ReadexPro'),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Color(0xffEEF2FF)),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: 'E-mail',
                                  filled: true,
                                  fillColor: Color(0xffEEF2FF),
                                ),
                              ),
                            ),
                            SizedBox(height: 20,),
                            Padding(
                              padding: const EdgeInsets.only(left: 30,right: 30),
                              child: TextField(
                                obscureText: _obsecuretext,
                                decoration: InputDecoration(
                                  suffixIcon: GestureDetector(
                                    onTap: (){
                                       setState(()=>_obsecuretext=!_obsecuretext);
                                  },
                                    child: Icon(
                                     _obsecuretext ? Icons.visibility : Icons.visibility_off
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Color(0xffEEF2FF)),
                                  ),
                                  hintStyle: TextStyle(fontFamily: 'ReadexPro'),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Color(0xffEEF2FF)),
                                    borderRadius: BorderRadius.circular(10),
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
                          height: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 30),
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
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                  fontFamily: 'ReadexPro'),
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
                              height: 55,
                              margin: const EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                color: Color(0xff001E6C),
                                borderRadius: BorderRadius.circular(10.0),
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
                              style: TextStyle(color: Colors.black, fontSize: 20,fontFamily: 'ReadexPro'),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, 'SignUp');
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(color: Colors.blue.shade900, fontSize: 20,fontFamily: 'ReadexPro'),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),)
    );
  }
}
