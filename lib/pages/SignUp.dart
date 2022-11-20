import 'package:flutter/material.dart';
import 'package:flutter_app/pages/LoginPage.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

//import 'package:flutter_app/pages/SignUpInputWrapper.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final List<String> Designation = [
    'Owner',
    'Project Manager',
    'Senior Engineer',
    'Junior Engineer',
  ];

  String? selectedValue;

  List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> items) {
    List<DropdownMenuItem<String>> menuItems = [];
    for (var item in items) {
      menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
          //If it's last item, we will not add Divider after it.
          if (item != items.last)
            const DropdownMenuItem<String>(
              enabled: false,
              child: Divider(),
            ),
        ],
      );
    }
    return menuItems;
  }

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
                      Container(
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
                              SizedBox(
                                height: 35,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 40, right: 40),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Color(0xffEEF2FF)),
                                        ),
                                        hintStyle:
                                            TextStyle(fontFamily: 'ReadexPro'),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color(0xffEEF2FF)),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        hintText: 'Name',
                                        filled: true,
                                        fillColor: Color(0xffEEF2FF),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 40, right: 40),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Color(0xffEEF2FF)),
                                        ),
                                        hintStyle:
                                            TextStyle(fontFamily: 'ReadexPro'),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color(0xffEEF2FF)),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        hintText: 'E-mail',
                                        filled: true,
                                        fillColor: Color(0xffEEF2FF),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 40, right: 40),
                                    child: TextField(
                                      obscureText: _showpassword,
                                      decoration: InputDecoration(
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            setState(() =>
                                                _showpassword = !_showpassword);
                                          },
                                          child: Icon(_showpassword
                                              ? Icons.visibility_sharp
                                              : Icons.visibility_off_sharp),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Color(0xffEEF2FF)),
                                        ),
                                        hintStyle:
                                            TextStyle(fontFamily: 'ReadexPro'),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color(0xffEEF2FF)),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        hintText: 'Password',
                                        filled: true,
                                        fillColor: Color(0xffEEF2FF),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 40, right: 40),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2(
                                        isExpanded: true,
                                        hint: TextField(
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Color(0xffEEF2FF)),
                                            ),
                                            hintStyle: TextStyle(
                                                fontFamily: 'ReadexPro'),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Color(0xffEEF2FF)),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            hintText: 'Designation',
                                            filled: true,
                                            fillColor: Color(0xffEEF2FF),
                                          ),
                                        ),
                                        items:
                                            _addDividersAfterItems(Designation),
                                        //customItemsIndexes: _getDividersIndexes(),
                                        //customItemsHeight: 4,
                                        value: selectedValue,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedValue = value as String;
                                          });
                                        },
                                        buttonHeight: 50,
                                        buttonWidth: 280,
                                        itemHeight: 40,
                                        itemPadding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
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
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPage()),
                                    );
                                  },
                                  child: Container(
                                    height: 50,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 25),
                                    decoration: BoxDecoration(
                                      color: Color(0xff001E6C),
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
