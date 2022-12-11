import 'package:flutter/material.dart';
import 'package:flutter_app/Server%20(Back%20End)/network_handler.dart';
import 'package:flutter_app/pages/select_page.dart';
import 'package:flutter_app/pages/drawerpage.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  NetworkHandler p = NetworkHandler();
  String a = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const DrawerPage(),
      body: FutureBuilder<List>(
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting)
          {
            return Container(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,color: Colors.white,child: const Center(child: CircularProgressIndicator(),),);
          }
          if(snapshot.hasData){

            return Scaffold(
              //endDrawer: const DrawerPage(),

              body: Container(
                color: const Color(0xffE5E5E5),

                child: Stack(children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xffE5E5E5),
                    ),
                  ),
                  Positioned(
                      left: 20,
                      top: 50,
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
                    left: 55,
                    top: 50,
                    child: Text(
                      "Dashboard",
                      style: TextStyle(fontSize: 30, fontFamily: 'OpenSans'),
                    ),
                  ),
                  Align(
                    alignment: const Alignment(0.94, -0.9),
                    child:  InkWell(
                      child: const Icon(
                        Icons.menu,
                        size: 30,
                        color: Colors.black,
                      ),
                        onTap: () => Scaffold.of(context).openEndDrawer(),
                    ),
                      ),
                  // Align(
                  //   alignment: const Alignment(0.94, -0.9),
                  //   child: Builder(
                  //     builder: (context) => IconButton(
                  //       icon: const Icon(Icons.menu),
                  //       iconSize: 30,
                  //       color: Colors.transparent,
                  //       onPressed: () => Scaffold.of(context).openEndDrawer(),
                  //       tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                  //     ),
                  //   ),
                  // ),
                  Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.15,
                        bottom: MediaQuery.of(context).size.height * 0.05,
                        //right: MediaQuery.of(context).size.height * 0.020,
                        //left: MediaQuery.of(context).size.height * 0.020
          ),
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, mainAxisSpacing: 15),
                      itemCount: snapshot.data?.length,
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
                                      style: const TextStyle(
                                          fontSize: 18, fontFamily: 'Inter'),
                                      //userList1[index].keys.elementAt(0).toString(),
                                      snapshot.data![index]["project_name"].toString(),
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

                                  const Padding(padding: EdgeInsets.only(bottom: 50,left: 25),
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text("40 %",style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: 'Inter',
                                      )),
                                    ),),

                                  Padding(padding: const EdgeInsets.only(bottom: 30),child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: LinearPercentIndicator(
                                      width: MediaQuery.of(context).size.width*0.38888,
                                      animation: true,
                                      barRadius: const Radius.circular(10),
                                      padding: const EdgeInsets.only(left: 20,right: 10),
                                      lineHeight: 17.0,
                                      percent: 0.4,
                                      backgroundColor: const Color(0xffE5E5E5),
                                      progressColor: const Color(0xffBDE6F1),
                                    ),
                                  ),),

                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>  SelectPage(projectName: snapshot.data![index]["project_name"].toString(),)));
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ]),
                // child:
              ),
            );
          }

          return const Text("Something Went Wrong");
        },
        future: p.listproject(),

      ),
    );
  }
}
