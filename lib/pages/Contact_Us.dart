import 'package:flutter/material.dart';
import 'package:flutter_app/Server%20(Back%20End)/network_handler.dart';
import 'package:flutter_app/pages/after_contact_page.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController subject = TextEditingController();
  TextEditingController message = TextEditingController();

  NetworkHandler p = NetworkHandler();

  bool response = false;

  SimpleDialog dialog() {
    return const SimpleDialog(
      children: [
        Center(
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Theme(
          data: Theme.of(context).copyWith(
            // ignore: deprecated_member_use
            androidOverscrollIndicator: AndroidOverscrollIndicator.values[0],
          ),
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                color: const Color(0xffBDE6F1),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 200,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            'assets/images/Polygon_contact.png',
                            width: MediaQuery.of(context).size.width,
                            //height: MediaQuery.of(context).size.height * 0.7,
                            fit: BoxFit.fill,
                            color: const Color(0xffE5E5E5),
                          ),
                          const Positioned(
                            top: 70,
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Text(
                                'How can we help you?',
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'assets/images/contact_bgimage.png',
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.42,
                        fit: BoxFit.contain,

                        //color: Color(0xffBDE6F1),
                      ),
                    ),
                    // const Align(
                    //   alignment: Alignment.center,
                    //   child: Text(
                    //     'How can we help you?',
                    //     style: TextStyle(fontSize: 30),
                    //   ),
                    // ),

                    Positioned(
                      left: 20,
                      top: 23,
                      child: InkWell(
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 30,
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    const Positioned(
                      top: 20,
                      //left: MediaQuery.of(context).size.width * 0.5 - 80,
                      child: Text(
                        "Contact Us",
                        style: TextStyle(fontSize: 30, fontFamily: 'OpenSans'),
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    color: const Color(0xffE5E5E5),
                    // margin: EdgeInsets.only(
                    //     top: MediaQuery.of(context).size.height * 0.4575),
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: name,
                          decoration: const InputDecoration(
                            hintText: "Name",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter Something";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: email,
                          decoration: const InputDecoration(
                            hintText: "E-mail",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter Something";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: subject,
                          decoration: const InputDecoration(
                            hintText: "Subject",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter Something";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: message,
                          maxLines: 5,
                          decoration: const InputDecoration(
                            hintText: "Type your message....",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter Something";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 60,
                          width: 200,
                          margin: const EdgeInsets.only(bottom: 20),
                          child: FloatingActionButton.extended(
                            onPressed: () async {
                              while (await p.contactDeveloper({
                                    "name": name.text,
                                    "email": email.text,
                                    "subject": subject.text,
                                    "message": message.text
                                  }) ==
                                  null) {
                                showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (_) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    });
                              }

                              // await Future.delayed(const Duration(seconds: 5),() {
                              //   const
                              //   response = true;
                              // },);

                              if (response == true) {
                                Navigator.of(context).pop();
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => const AfterPage()));
                              }
                            },
                            label: const Text("Send",
                                style: TextStyle(fontSize: 25)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
