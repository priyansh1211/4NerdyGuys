// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
//import 'package:get/get.dart';
import 'package:flutter_app/Server%20(Back%20End)/network_handler.dart';
// import 'package:flutter_app/pages/LoginPage.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_app/pages/LoginPage.dart';
//import 'package:flutter_app/pages/home_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var Designation = [
    'Owner',
    'Project Manager',
    'Senior Engineer',
    'Junior Engineer',
  ];

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController designation = TextEditingController();

  List<Map<String, String>> userList = [
    {"vedant.chvn0211@gmail.com": "123456"},
    {"aaa@gmail.com": "123456"},
    {"priyansh@gmail.com": "123456"}
  ];

  String? selectedValue;

  String downvalue = 'Select Designation';


  //
  // List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> items) {
  //   List<DropdownMenuItem<String>> menuItems = [];
  //   for (var item in items) {
  //     menuItems.addAll(
  //       [
  //         DropdownMenuItem<String>(
  //           value: item,
  //           child: Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 8.0),
  //             child: Text(
  //               item,
  //               style: const TextStyle(
  //                 fontSize: 14,
  //               ),
  //             ),
  //           ),
  //         ),
  //         //If it's last item, we will not add Divider after it.
  //         if (item != items.last)
  //           const DropdownMenuItem<String>(
  //             enabled: false,
  //             child: Divider(),
  //           ),
  //       ],
  //     );
  //   }
  //   return menuItems;
  // }

  final fkey = GlobalKey<FormState>();
  final NetworkHandler p = NetworkHandler();

  // List<int> _getDividersIndexes() {
  //   List<int> dividersIndexes = [];
  //   for (var i = 0; i < (Designation.length * 2) - 1; i++) {
  //     //Dividers indexes will be the odd indexes
  //     if (i.isOdd) {
  //       dividersIndexes.add(i);
  //     }
  //   }
  //   return dividersIndexes;
  // }

  bool _showpassword = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          ClipRRect(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                  Color(0xffBDE6F1),
                  Color(0xffBDE6F1),
                ]),
              ),
              child: Stack(
                //alignment: Alignment.center,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Positioned(
                      top: 22,
                      right: 16,
                      // alignment: Alignment.topRight,
                      child: Image.asset('assets/images/icon.png')),
                  Column(
                    children: [
                      SizedBox(
                        width: size.width,
                        height: size.height * 0.29875,
                        // color: Colors.blue,
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Color(0xffE5E5E5),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(21),
                                  topRight: Radius.circular(21))),
                          child: ListView(
                            // reverse: true,
                            shrinkWrap: true,
                            children: <Widget>[
                              const SizedBox(
                                height: 35,
                              ),
                              Form(
                                key: fkey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 40, right: 40),
                                      child: TextFormField(
                                        controller: name,
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
                                          hintText: 'Name',
                                          filled: true,
                                          fillColor: const Color(0xffEEF2FF),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Enter Your Name";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 40, right: 40),
                                      child: TextFormField(
                                        controller: email,
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
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Enter Email";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 40, right: 40),
                                      child: TextFormField(
                                        controller: password,
                                        obscureText: _showpassword,
                                        decoration: InputDecoration(
                                          suffixIcon: GestureDetector(
                                            onTap: () {
                                              setState(() => _showpassword =
                                                  !_showpassword);
                                            },
                                            child: Icon(_showpassword
                                                ? Icons.visibility_sharp
                                                : Icons.visibility_off_sharp),
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
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Enter Password";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 40, right: 40),
                                      child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        color: const Color(0xffEEF2FF),
                                        child: DropdownButtonHideUnderline(
                                        child: DropdownButton2(

                                          //isExpanded: true,
                                          dropdownDecoration: const BoxDecoration(color: Color(0xffEEF2FF)),
                                          hint: Padding( padding: const EdgeInsets.only(left: 13), child: Text(downvalue),),

                                          items: Designation.map((String Designation){
                                            return DropdownMenuItem(
                                              value : Designation,
                                              child: Padding(padding: const EdgeInsets.only(left: 13),child: Text(Designation),),

                                            );
                                          }).toList(),

                                          onChanged: (String? value) {
                                            setState(() {
                                              downvalue = value!;
                                            });
                                          },
                                          buttonHeight: 50,
                                          buttonWidth: 280,
                                          itemHeight: 40,
                                          itemPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 8.0),

                                        ),
                                      ),),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              MaterialButton(
                                  onPressed: () {
                                    if (fkey.currentState!.validate()) {

                                       p.post({"username": name.text ,"email":email.text ,"password": password.text , "designation": downvalue});

                                      bool NotUser = false;
                                      int i;
                                      for (i = 0; i < userList.length; i++) {
                                        if (userList[i]
                                                .keys
                                                .elementAt(0)
                                                .toString() ==
                                            email.text.toString()) {
                                          NotUser = true;
                                        }
                                      }
                                      if (NotUser == true) {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return Align(
                                                alignment:
                                                    const Alignment(0, -1.5),
                                                child: Container(
                                                  height: 400,
                                                  margin: const EdgeInsets.only(
                                                      top: 10),
                                                  decoration:
                                                      const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle),
                                                  child: AlertDialog(
                                                    title: const Text(
                                                        "Permission Needed"),
                                                    content: const Text(
                                                        "New User is trying to Sign Up"),
                                                    actions: [
                                                      TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: const Text(
                                                              "Accept")),
                                                      TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: const Text(
                                                              "Reject")),
                                                    ],
                                                    actionsAlignment:
                                                        MainAxisAlignment.end,
                                                  ),
                                                ),
                                              );
                                            });
                                      } else {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginPage()));
                                      }
                                    }
                                  },
                                  child: Container(
                                    height: 50,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 25),
                                    decoration: BoxDecoration(
                                      color: const Color(0xff001E6C),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "SignUp",
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
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: size.height * 0.105,
                    left: 92,
                    right: 92,
                    child: Image.asset(
                      'assets/images/sign_up.png',
                      height: 176,
                      width: 176,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
