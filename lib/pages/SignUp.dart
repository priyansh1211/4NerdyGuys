import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home_page.dart';
import 'package:form_field_validator/form_field_validator.dart';
class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void validate(){
    if(formkey.currentState!.validate()){
      print("Validated");
    }
    else{
      print("Not validated");
    }
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextFormField(
                  decoration : InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "E-mail",
                      hintText: "Enter your email"),
                  validator: MultiValidator(
                      [
                        RequiredValidator(errorText: "Required"),
                        EmailValidator(errorText: "Not a valid E-mail"),
                      ]
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 20.0),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        fillColor: Color(0x00EEF2FF),
                        border: OutlineInputBorder(),
                        labelText: "Password",
                        hintText: "Enter your password"),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Required";
                      }
                      else if(value.length < 6){
                        return "Should be at least 6 characters";
                      }else if(value.length > 15){
                        return "Should not be more than 15 characters";
                      }else{
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: OutlinedButton(
                    onPressed: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage(),));
                    },
                    child: Text("Log in"),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('Don\'t have an account?',
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'SignUp');
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(color: Colors.blueAccent, fontSize: 20),
                    ),
                  )
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
