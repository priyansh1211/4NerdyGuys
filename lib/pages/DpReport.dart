import 'package:flutter/material.dart';
import 'package:flutter_app/pages/DesignRequirement.dart';
import 'package:flutter_app/pages/MachineryReport.dart';
import 'package:flutter_app/pages/ManPowerReport.dart';
import 'package:flutter_app/pages/MaterialReport.dart';
import 'package:flutter_app/pages/NextDayPlanning.dart';
import 'package:flutter_app/pages/TargetVsAchieved.dart';
import 'package:flutter_app/pages/WorkDoneToday.dart';

class DpReportPage extends StatefulWidget {
  const DpReportPage({Key? key}) : super(key: key);

  @override
  State<DpReportPage> createState() => _DpReportPageState();
}

class _DpReportPageState extends State<DpReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xffE5E5E5),
              ),
            ),
            const Positioned(
              left: 20,
              top: 10,
              child: Icon(
                Icons.arrow_back_ios,
                size: 30,
              ),
            ),
            const Positioned(
              left: 50,
              top: 10,
              child: Text(
                "Daily Project Report",
                style: TextStyle(fontSize: 30, fontFamily: 'OpenSans'),
              ),
            ),
            Align(
              alignment: const Alignment(0.97, -0.99),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: Center(
                  child: Icon(
                    Icons.person,
                    size: 20,
                    color: Colors.blue[500],
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Stack(
                      children: [
                        // Card(
                        //   shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(20.0)),
                        //   color: const Color(0xffBDE6F1),
                        //   child: Container(
                        //     margin: EdgeInsets.only(
                        //       top: 50
                        //     ),
                        //     height: 125,
                        //     width: 328,
                        //     child: const Align(
                        //       alignment: const Alignment(-0.85, -0.65),
                        //       child: const Text(
                        //         "Sanskruti",
                        //         style: const TextStyle(
                        //           fontFamily: 'ReadexPro',
                        //           fontSize: 24,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Container(
                          height: 125,
                          width: 328,
                          margin: const EdgeInsets.only(
                            top: 60,
                          ),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            color: const Color(0xffBDE6F1),
                            elevation: 20,
                            child: const Align(
                              alignment: Alignment(-0.85, -0.65),
                              child: Text(
                                "Sanskruti",
                                style: TextStyle(
                                  fontFamily: 'ReadexPro',
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Positioned(
                        //   top: 144,
                        //   child: ElevatedButton(
                        //     child: Text("View Task"),
                        //     onPressed: () {},
                        //   ),
                        // ),
                        Container(
                          height: 32,
                          width: 65,
                          margin: const EdgeInsets.only(
                            top: 133,
                            left: 30,
                          ),
                          child: InkWell(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              color: const Color(0xff242F9B),
                              child: const Align(
                                alignment: Alignment(0,0),
                                child: Text(
                                  "View Task",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 9,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffFFFFFF),
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {},
                          ),
                        ),
                        // Positioned(
                        //   top: 133,
                        //   left: 24,
                        //   child: Card(
                        //     shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(100)),
                        //     child: Container(
                        //       height: 32,
                        //       width: 65,
                        //       color: const Color(0xff242F9B),
                        //       child: const Align(
                        //         alignment: const Alignment(0,0),
                        //         child: const Text(
                        //           "View Task",
                        //           style: const TextStyle(
                        //             fontFamily: 'Montserrat',
                        //             fontSize: 9,
                        //             color: Color(0xffFFFFFF),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Stack(
                      children: [
                        InkWell(
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: const SizedBox(
                              height: 142,
                              width: 147,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ManPowerReport()));
                            },
                        ),
                        const Positioned(
                          top: 11,
                          left: 11,
                          child: Text(
                            "Man power\nreport",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Positioned(
                          top: 67,
                          left: 60,
                          child: Image.asset('assets/images/Data_analysis.png'),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        InkWell(
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: const SizedBox(
                              height: 142,
                              width: 147,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> MachineryReport() ));
                          },
                        ),
                        const Positioned(
                          top: 11,
                          left: 11,
                          child: Text(
                            "Machinery\nreport",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Positioned(
                          top: 67,
                          left: 60,
                          child: Image.asset('assets/images/Data_analysis.png'),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Stack(
                      children: [
                        InkWell(
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: const SizedBox(
                              height: 142,
                              width: 147,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> WorkDoneToday() ));
                          },
                        ),
                        const Positioned(
                          top: 11,
                          left: 11,
                          child: Text(
                            "Work done\ntoday",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Positioned(
                          top: 67,
                          left: 60,
                          child: Image.asset('assets/images/Data_analysis.png'),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        InkWell(
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: const SizedBox(
                              height: 142,
                              width: 147,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> MaterialReport() ));
                          },
                        ),
                        const Positioned(
                          top: 11,
                          left: 11,
                          child: Text(
                            "Material\nreport",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Positioned(
                          top: 67,
                          left: 60,
                          child: Image.asset('assets/images/Data_analysis.png'),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Stack(
                      children: [
                        InkWell(
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: const SizedBox(
                              height: 142,
                              width: 147,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DesignRequirement()));
                          },
                        ),
                        const Positioned(
                          top: 11,
                          left: 11,
                          child: Text(
                            "Design\nrequirements",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Positioned(
                          top: 67,
                          left: 60,
                          child: Image.asset('assets/images/Data_analysis.png'),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        InkWell(
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: const SizedBox(
                              height: 142,
                              width: 147,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> NextDayPlanning() ));
                          },
                        ),
                        const Positioned(
                          top: 11,
                          left: 11,
                          child: Text(
                            "Next day\nplanning\n(Target)",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Positioned(
                          top: 67,
                          left: 60,
                          child: Image.asset('assets/images/Data_analysis.png'),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Stack(
                      children: [
                        InkWell(
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: const SizedBox(
                              height: 64,
                              width: 310,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> TargetVsAchieved() ));
                          },
                        ),
                        const Positioned(
                          top: 11,
                          left: 11,
                          child: Text(
                            "Target vs achieved",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Positioned(
                          top: 17,
                          left: 259,
                          child: Image.asset(
                            'assets/images/Data_analysis.png',
                            width: 51,
                            height: 47,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
