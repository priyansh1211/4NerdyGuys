import 'package:flutter/material.dart';
import 'package:flutter_app/pages/TypesOfReport.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
   List<Map<String, int>> userList1 = [
    {'Sanskruti': 10},
    {'Antriksh': 15},
    {'Nakshtra': 18},
    {'Sanskruti': 10},
    {'Antriksh': 15},
    {'Nakshtra': 18},
    {'Sanskruti': 10},
    {'Antriksh': 15},
    {'Nakshtra': 18}
  ];
   
  String a = '';
  
  String getString(int index)
  {
    a= userList1[index].keys.elementAt(0).toString();
    return a;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned(top : 23, left : 60,child: Text("Dashboard",style: TextStyle(fontSize: 30),)),

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

          Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.09,
                bottom: MediaQuery.of(context).size.height * 0.030,
                right: MediaQuery.of(context).size.height * 0.020,
                left: MediaQuery.of(context).size.height * 0.020),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 15),
              itemCount: userList1.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 200,
                  width: 148,
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  child: InkWell(
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      elevation: 10.0,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 13,
                            left: 11,
                            child: Image.asset('assets/images/proj_2.png'),
                          ),
                          Positioned(
                            top: 69,
                            left: 16,
                            child: Text(
                               userList1[index].keys.elementAt(0).toString(),

                              style:
                              const TextStyle(fontSize: 18, fontFamily: 'Inter'),
                            ),
                          ),

                          const Positioned(
                            top: 90,
                            left: 17,
                            child: Text(
                              "Ongoing Site",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: 'Inter',
                                  color: Color(0xff796A6A)),
                            ),
                          ),

                        ],
                      ),
                    ),
                    onTap: () {

                      Navigator.push(context, MaterialPageRoute(builder: (context) => TypesOfReport(projectName: userList1[index].keys.elementAt(0).toString(),)));
                    },
                  ),
                  // child : Card(child: Center(child: Text(userList1[index].keys.elementAt(0).toString())))
                );
              },
            ),
          ),
        ],
      ),
      );
  }
}
