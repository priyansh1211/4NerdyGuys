import 'package:flutter/material.dart';
import 'package:flutter_app/pages/DesignRequirement.dart';
import 'package:flutter_app/pages/MachineryReport.dart';
import 'package:flutter_app/pages/ManPowerReport.dart';
import 'package:flutter_app/pages/MaterialReport.dart';
import 'package:flutter_app/pages/NextDayPlanning.dart';
import 'package:flutter_app/pages/TargetVsAchieved.dart';
import 'package:flutter_app/pages/WorkDoneToday.dart';
import 'package:flutter_app/pages/tasks.dart';
import 'package:flutter_app/pages/drawerpage.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class DpReportPage extends StatefulWidget {
  final String pName;
  const DpReportPage({Key? key, required this.pName}) : super(key: key);

  @override
  State<DpReportPage> createState() => _DpReportPageState();
}

class _DpReportPageState extends State<DpReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const DrawerPage(),
      body: Center(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xffE5E5E5),
              ),
            ),
            Positioned(
                left: 20,
                top: 30,
                child: InkWell(
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                )),
            const Positioned(
              left: 50,
              top: 30,
              child: Text(
                "Daily Project Report",
                style: TextStyle(fontSize: 30, fontFamily: 'OpenSans'),
              ),
            ),
            Align(
              alignment: const Alignment(0.94, -0.94),
              child: CircleAvatar(
                radius: 25,
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
            Align(
              alignment: const Alignment(0.94,-0.94),
              child: Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu),
                  iconSize: 30,
                  color: Colors.transparent,
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                  tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
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
                        Container(
                            height:
                                MediaQuery.of(context).size.height * 0.15625,
                            width: MediaQuery.of(context).size.width * 0.9111,
                            margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.08875,
                            ),
                            child: Stack(
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  color: const Color(0xffBDE6F1),
                                  elevation: 20,
                                  child: Align(
                                    alignment: const Alignment(-0.85, -0.65),
                                    child: Text(
                                      widget.pName,
                                      style: const TextStyle(
                                        fontFamily: 'ReadexPro',
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: MediaQuery.of(context).size.height * 0.03125 - 10 , //MediaQuery.of(context).size.height*0.020,
                                  left: MediaQuery.of(context).size.width *
                                      0.6275833,

                                  child: CircularPercentIndicator(
                                    radius: 45.0,
                                    backgroundColor: Colors.white,
                                    percent: 0.8,
                                    progressColor: const Color(0xff242F9B),
                                    lineWidth: 9,
                                    circularStrokeCap: CircularStrokeCap.round,
                                    animation: true,
                                    animationDuration: 3000,
                                    center: const Text('80%',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff242F9B))),
                                  ),
                                )
                              ],
                            )),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.04,
                          width: MediaQuery.of(context).size.width * 0.18166,
                          margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.18,
                            left: MediaQuery.of(context).size.width * 0.05,
                          ),
                          child: InkWell(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              color: const Color(0xff242F9B),
                              child: const Align(
                                alignment: Alignment(0, 0),
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
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const TasksPage()));
                            },
                          ),
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
                            child: SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.1825,
                              width: MediaQuery.of(context).size.width * 0.444,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ManPowerReport()));
                          },
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.0141375,
                          left: MediaQuery.of(context).size.width * 0.04972,
                          child: const Text(
                            "Man power\nreport",
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.0861125,
                          left: MediaQuery.of(context).size.width * 0.182777,
                          child: Image.asset(
                            'assets/images/Data_analysis.png',
                            width: MediaQuery.of(context).size.width * 0.2611,
                            height:
                                MediaQuery.of(context).size.height * 0.0963875,
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        InkWell(
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.1825,
                              width: MediaQuery.of(context).size.width * 0.444,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const MachineryReport()));
                          },
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.0171375,
                          left: MediaQuery.of(context).size.width * 0.04972,
                          child: const Text(
                            "Machinery\nreport",
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.0861125,
                          left: MediaQuery.of(context).size.width * 0.182777,
                          child: Image.asset(
                            'assets/images/Data_analysis.png',
                            width: MediaQuery.of(context).size.width * 0.2611,
                            height:
                                MediaQuery.of(context).size.height * 0.0963875,
                          ),
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
                            child: SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.1825,
                              width: MediaQuery.of(context).size.width * 0.444,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const WorkDoneToday()));
                          },
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.0141375,
                          left: MediaQuery.of(context).size.width * 0.04972,
                          child: const Text(
                            "Work done\ntoday",
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.0861125,
                          left: MediaQuery.of(context).size.width * 0.182777,
                          child: Image.asset(
                            'assets/images/marketer.png',
                            width: MediaQuery.of(context).size.width * 0.2611,
                            height:
                                MediaQuery.of(context).size.height * 0.0963875,
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        InkWell(
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.1825,
                              width: MediaQuery.of(context).size.width * 0.444,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const MaterialReport()));
                          },
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.0141375,
                          left: MediaQuery.of(context).size.width * 0.04972,
                          child: const Text(
                            "Material\nreport",
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.0861125,
                          left: MediaQuery.of(context).size.width * 0.182777,
                          child: Image.asset(
                            'assets/images/marketer.png',
                            width: MediaQuery.of(context).size.width * 0.2611,
                            height:
                                MediaQuery.of(context).size.height * 0.0963875,
                          ),
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
                            child: SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.1825,
                              width: MediaQuery.of(context).size.width * 0.444,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const DesignRequirement()));
                          },
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.0141375,
                          left: MediaQuery.of(context).size.width * 0.04972,
                          child: const Text(
                            "Design\nrequirements",
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.0861125,
                          left: MediaQuery.of(context).size.width * 0.182777,
                          child: Image.asset(
                            'assets/images/Data_analysis2.png',
                            width: MediaQuery.of(context).size.width * 0.2611,
                            height:
                                MediaQuery.of(context).size.height * 0.0963875,
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        InkWell(
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.1825,
                              width: MediaQuery.of(context).size.width * 0.444,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const NextDayPlanning()));
                          },
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.0141375,
                          left: MediaQuery.of(context).size.width * 0.04972,
                          child: const Text(
                            "Next day\nplanning\n(Target)",
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.0861125,
                          left: MediaQuery.of(context).size.width * 0.182777,
                          child: Image.asset(
                            'assets/images/Data_analysis2.png',
                            width: MediaQuery.of(context).size.width * 0.2611,
                            height:
                                MediaQuery.of(context).size.height * 0.0963875,
                          ),
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
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.08,
                              width: MediaQuery.of(context).size.width * 0.9111,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const TargetVsAchieved()));
                          },
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.0141375,
                          left: MediaQuery.of(context).size.width * 0.04972,
                          child: const Text(
                            "Target vs achieved",
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.025,
                          left: MediaQuery.of(context).size.width * 0.7111,
                          child: Image.asset(
                            'assets/images/testing.png',
                            width: MediaQuery.of(context).size.width * 0.1833,
                            height:
                                MediaQuery.of(context).size.height * 0.05125,
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
