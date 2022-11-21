// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_app/pages/DpReport.dart';
import 'package:flutter_app/pages/ProjectProgress.dart';

class TypesOfReport extends StatefulWidget {
  final String projectName;

    const TypesOfReport({Key? key, required this.projectName}) : super(key: key);

  @override
  State<TypesOfReport> createState() => _TypesOfReportState();
}

class _TypesOfReportState extends State<TypesOfReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      body: Column(
        children: [
          const SizedBox(
            height: 55,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Hello,Vishwas",
                hintStyle: const TextStyle(
                  fontFamily: "ReadexPro",
                  fontSize: 30,
                  color: Colors.black,
                ),
                border: InputBorder.none,
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () {},
                    child: const CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        size: 30,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Choose Report",
                border: InputBorder.none,
                hintStyle: TextStyle(
                  fontFamily: "ReadexPro",
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            children: [
              InkWell(
                child: Container(
                  height: 125,
                  width: 275,
                  margin: const EdgeInsets.only(
                      bottom: 6.0), //Same as `blurRadius` i guess
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: const Color(0xffBDE6F1),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      const Positioned(
                          top: 85,
                          left: 220,
                          child: Icon(
                            Icons.add_box_rounded,
                            size: 30,
                          )),
                      const Positioned(
                        height: 40,
                        width: 110,
                        right: 30,
                        bottom: 60,
                        child: Text(
                          "Daily Progress Report",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'ReadexPro',
                            fontWeight: FontWeight.w600,
                            //color: Color(0xffBDE6F1),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        height: 101,
                        width: 108,
                        left: 10,
                        child: Image.asset('assets/images/report1.png'),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DpReportPage(pName : widget.projectName,)));
                },
              ),

              // Stack(
              //   children: [
              //     InkWell(
              //       child: Card(
              //         color: const Color(0xffBDE6F1),
              //         shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(30.0)),
              //         child: const SizedBox(
              //           height: 125,
              //           width: 275,
              //         ),
              //       ),
              //       onTap: () {
              //         Navigator.push(context, MaterialPageRoute(builder: (context)=> const DpReportPage() ));
              //       },
              //     ),
              //     const Positioned(
              //       height: 40,
              //       width: 110,
              //       right: 30,
              //       bottom: 60,
              //       child: Text(
              //         "Daily Progress Report",
              //         style: TextStyle(
              //             fontSize: 16,
              //             fontFamily: 'ReadexPro',
              //             fontWeight: FontWeight.w600,
              //         //color: Color(0xffBDE6F1),
              //       ),
              //     ),
              //     ),
              //     Positioned(
              //       top: 10,
              //       height: 101,
              //       width: 108,
              //       left: 10,
              //       child: Image.asset('assets/images/report1.png'),
              //     ),
              //       FloatingActionButton(
              //         shape:RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(50),
              //         ),
              //           onPressed: (){
              //           Navigator.push(context, MaterialPageRoute(builder: (context)=>const DpReportPage()));
              //    },
              //        // elevation: 10,
              //         backgroundColor: Colors.black,
              //         child: const Icon(Icons.add),
              //    ),
              //    // FloatingActionButtonLocation.endFloat
              //    ],
              // ),

              const SizedBox(
                height: 20,
              ),

              InkWell(
                child: Container(
                  height: 125,
                  width: 275,
                  margin: const EdgeInsets.only(
                      bottom: 6.0), //Same as `blurRadius` i guess
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: const Color(0xffBDE6F1),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      const Positioned(
                          top: 85,
                          left: 220,
                          child: Icon(
                            Icons.add_box,
                            size: 30,
                          )),
                      const Positioned(
                        height: 40,
                        width: 110,
                        right: 30,
                        bottom: 60,
                        child: Text(
                          "Site Progress Report",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'ReadexPro',
                            fontWeight: FontWeight.w600,
                            //color: Color(0xffBDE6F1),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        height: 101,
                        width: 108,
                        left: 10,
                        child: Image.asset('assets/images/report2.png'),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProjectProgress()));
                },
              ),

            ],
          ),
        ],
      ),
    );
  }
}
