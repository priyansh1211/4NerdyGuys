import 'package:flutter/material.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({Key? key}) : super(key: key);
  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xffE5E5E5),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/images/bgimage.png',
                width: screensize.width,
                height: screensize.height * 0.36,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 30,
              top: 46,
              child: InkWell(
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  }),
            ),
            const Positioned(
              left: 30,
              top: 100,
              child: Text(
                "Inventory",
                style: TextStyle(fontSize: 30, fontFamily: 'ReadexPro'),
              ),
            ),
            Container(
              width: screensize.width,
              margin: EdgeInsets.only(
                top: screensize.height * 0.38,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: screensize.width * 0.81,
                      height: screensize.height * 0.17625,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(27.0),
                        color: const Color(0xffBDE6F1),
                      ),
                      child: InkWell(
                        child: Row(
                          children: [
                            Container(
                              width: screensize.width * 0.35,
                              height: screensize.height * 0.16,
                              margin: EdgeInsets.only(
                                left: screensize.width * 0.045,
                                top: screensize.height * 0.02,
                              ),
                              alignment: Alignment.center,
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(
                                      'Sanskruti',
                                      style: TextStyle(
                                          fontFamily: 'Readxpro', fontSize: 25),
                                    ),
                                    Text(
                                      'Ongoing Site',
                                      style: TextStyle(
                                          fontFamily: 'Readxpro', fontSize: 15),
                                    ),
                                    Text(
                                      '\n73%',
                                      style: TextStyle(
                                          fontFamily: 'Readxpro', fontSize: 30),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: screensize.width * 0.34,
                              height: screensize.height * 0.13,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(27.0),
                                color: const Color(0xffFFFFFF),
                              ),
                              margin: EdgeInsets.only(
                                left: screensize.width * 0.03,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    'Tasks',
                                    style: TextStyle(
                                        fontFamily: 'Readxpro', fontSize: 23),
                                  ),
                                  Text(
                                    '46%',
                                    style: TextStyle(
                                        fontFamily: 'Readxpro', fontSize: 23),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: screensize.width * 0.81,
                      height: screensize.height * 0.17625,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(27.0),
                        color: const Color(0xffBDE6F1),
                      ),
                      margin: EdgeInsets.only(
                        top: screensize.height * 0.03,
                      ),
                      child: InkWell(
                        child: Row(
                          children: [
                            Container(
                              width: screensize.width * 0.35,
                              height: screensize.height * 0.16,
                              margin: EdgeInsets.only(
                                left: screensize.width * 0.045,
                                top: screensize.height * 0.02,
                              ),
                              alignment: Alignment.center,
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(
                                      'Antriksh',
                                      style: TextStyle(
                                          fontFamily: 'Readxpro', fontSize: 25),
                                    ),
                                    Text(
                                      'Ongoing Site',
                                      style: TextStyle(
                                          fontFamily: 'Readxpro', fontSize: 15),
                                    ),
                                    Text(
                                      '\n50%',
                                      style: TextStyle(
                                          fontFamily: 'Readxpro', fontSize: 30),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: screensize.width * 0.35,
                              height: screensize.height * 0.13,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(27.0),
                                color: const Color(0xffFFFFFF),
                              ),
                              margin: EdgeInsets.only(
                                left: screensize.width * 0.03,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    'Tasks',
                                    style: TextStyle(
                                        fontFamily: 'Readxpro', fontSize: 23),
                                  ),
                                  Text(
                                    '70%',
                                    style: TextStyle(
                                        fontFamily: 'Readxpro', fontSize: 23),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: screensize.width * 0.81,
                      height: screensize.height * 0.17625,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(27.0),
                        color: const Color(0xffBDE6F1),
                      ),
                      margin: EdgeInsets.only(top: screensize.height * 0.03),
                      child: InkWell(
                        child: Row(
                          children: [
                            Container(
                              width: screensize.width * 0.35,
                              height: screensize.height * 0.16,
                              margin: EdgeInsets.only(
                                left: screensize.width * 0.045,
                                top: screensize.height * 0.02,
                              ),
                              alignment: Alignment.center,
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(
                                      'Nakshtra',
                                      style: TextStyle(
                                          fontFamily: 'Readxpro', fontSize: 25),
                                    ),
                                    Text(
                                      'Ongoing Site',
                                      style: TextStyle(
                                          fontFamily: 'Readxpro', fontSize: 15),
                                    ),
                                    Text(
                                      '\n60%',
                                      style: TextStyle(
                                          fontFamily: 'Readxpro', fontSize: 30),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: screensize.width * 0.35,
                              height: screensize.height * 0.13,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(27.0),
                                color: const Color(0xffFFFFFF),
                              ),
                              margin: EdgeInsets.only(
                                left: screensize.width * 0.03,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    'Tasks',
                                    style: TextStyle(
                                        fontFamily: 'Readxpro', fontSize: 23),
                                  ),
                                  Text(
                                    '55%',
                                    style: TextStyle(
                                        fontFamily: 'Readxpro', fontSize: 23),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
