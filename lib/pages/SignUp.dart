import 'package:flutter/material.dart';
import 'package:flutter_app/pages/SignUpInputWrapper.dart';
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
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                  Colors.grey.shade500,
                  Colors.white,
                  Colors.grey.shade400,
                ])),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 70,
                ),
                Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(60),
                              topRight: Radius.circular(60))),
                      child: const SignUpInputWrapper(),
                    )),
              ],
            ),
          ),)
    );
  }
}
