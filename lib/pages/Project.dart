import 'package:flutter/material.dart';
import 'package:flutter_app/Server%20(Back%20End)/network_handler.dart';
import 'package:flutter_app/pages/Dashboard/Add_Project.dart';
import 'package:flutter_app/pages/Project/giEdit_Project.dart';
import 'package:flutter_app/pages/TypesOfReport.dart';
import 'package:flutter_app/pages/drawerpage.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  final fkey = GlobalKey<FormState>();

  NetworkHandler p = NetworkHandler();

  bool designation = false;

  @override
  void initState() {
    initial().then(updateDesignation);
    super.initState();
  }

  Future<bool> initial() async {
    SharedPreferences? preferences = await SharedPreferences.getInstance();
    if (preferences.getString("Designation") == 'Owner' ||
        preferences.getString("Designation") == 'Project Manager') {
      return true;
    } else {
      return false;
    }
  }

  void updateDesignation(bool designation) {
    setState(() {
      this.designation = designation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: const DrawerPage(),
        body: FutureBuilder<List>(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.white,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (snapshot.hasData) {
              return Scaffold(
                floatingActionButton: designation
                    ? SizedBox(
                        width: 64,
                        height: 45,
                        child: FloatingActionButton(
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(5.1)),
                          backgroundColor: const Color(0xff91DEF2),
                          child: const Icon(Icons.add),
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AddProjectPage()),
                            );
                          },
                        ),
                      )
                    : null,
                floatingActionButtonLocation: designation
                    ? FloatingActionButtonLocation.centerFloat
                    : null,
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
                        "Projects",
                        style: TextStyle(fontSize: 30, fontFamily: 'OpenSans'),
                      ),
                    ),
                    Align(
                      alignment: const Alignment(0.94, -0.9),
                      child: InkWell(
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
                          right: MediaQuery.of(context).size.height * 0.015,
                          left: MediaQuery.of(context).size.height * 0.015),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, mainAxisSpacing: 15),
                        itemCount: snapshot.data?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width *
                                    0.0111111,
                                right: MediaQuery.of(context).size.width *
                                    0.0111111),
                            child: InkWell(
                              child: Card(
                                margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.022222,
                                    right: MediaQuery.of(context).size.width *
                                        0.02222),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                elevation: 10.0,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 13, left: 8),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Image.asset(
                                            'assets/images/proj_2.png'),
                                      ),
                                    ),
                                    designation
                                        ? Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10, top: 10),
                                            child: Align(
                                              alignment: Alignment.topRight,
                                              child: InkWell(
                                                child: const Icon(Icons.edit),
                                                onTap: () {
                                                  Navigator.of(context).pop();
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              EditProjectPage(
                                                                newprojectName: snapshot
                                                                    .data![
                                                                        index][
                                                                        "project_name"]
                                                                    .toString(),
                                                                newfloors: snapshot
                                                                            .data![
                                                                        index]
                                                                    ["floors"],
                                                                newblocks: snapshot
                                                                            .data![
                                                                        index]
                                                                    ["blocks"],
                                                              )));
                                                },
                                              ),
                                            ),
                                          )
                                        : Container(),
                                    Positioned(
                                      top: MediaQuery.of(context).size.height *
                                          0.08625,
                                      left: MediaQuery.of(context).size.height *
                                          0.0239166,
                                      child: Text(
                                        style: const TextStyle(
                                            fontSize: 18, fontFamily: 'Inter'),
                                        snapshot.data![index]["project_name"]
                                            .toString(),
                                      ),
                                    ),
                                    Positioned(
                                      top: MediaQuery.of(context).size.height *
                                          0.1125,
                                      left: MediaQuery.of(context).size.height *
                                          0.0239166,
                                      child: const Text(
                                        "Ongoing Site",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontFamily: 'Inter',
                                            color: Color(0xff796A6A)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.04125,
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04125),
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                            " ${snapshot.data![index]["progress"].toString()} %",
                                            style: const TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'Inter',
                                            )),
                                      ),
                                    ),
                                    Positioned(
                                      bottom:
                                          MediaQuery.of(context).size.height *
                                              0.0175,
                                      child: LinearPercentIndicator(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.38888,
                                        animation: true,
                                        barRadius: const Radius.circular(10),
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        lineHeight: 17.0,
                                        percent: snapshot.data![index]
                                                ["progress"] /
                                            10,
                                        backgroundColor:
                                            const Color(0xffE5E5E5),
                                        progressColor: const Color(0xffBDE6F1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TypesOfReport(
                                              projectName: snapshot.data![index]
                                                      ["project_name"]
                                                  .toString(),
                                              progress: snapshot.data![index]
                                                  ["progress"],
                                            )));
                                // if(designation)
                                //   {
                                //     Navigator.push(
                                //         context,
                                //         MaterialPageRoute(
                                //             builder: (context) => const OwnerPage()));
                                //   }
                                // else {
                                //     Navigator.push(
                                //         context,
                                //         MaterialPageRoute(
                                //             builder: (context) => TypesOfReport(
                                //               projectName: snapshot.data![index]["project_name"].toString(),
                                //             )));
                                //   }
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
        ));
  }
}
