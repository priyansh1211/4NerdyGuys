import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          color: Colors.grey.shade100,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(13),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    hintText: 'Enter your name',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter your password',
                  ),
                ),
              ),
              OutlinedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blue.shade900)),
                  child: const Text('Log in',
                      style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Alert Message"),
                            content: Text(nameController.text),
                            actions: <Widget>[
                              new FlatButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          );
                        });
                  }),
              SizedBox(
                height: 10,
              ),
              Row(children: [
                Text('Don\'t have an account?',
                    style: TextStyle(color: Colors.black, fontSize: 20)),
                InkWell(onTap: (){},
                  child: Text(
                    'Sign up',
                    style: TextStyle(color: Colors.blueAccent, fontSize: 20),
                  ),
                )
              ],
                  mainAxisAlignment:MainAxisAlignment.center)
            ],
          ),
        ),
      ),
    );
  }
}
