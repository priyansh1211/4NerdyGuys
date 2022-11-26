import 'package:flutter/material.dart';
import 'package:flutter_app/Server%20(Back%20End)/network_handler.dart';
import 'package:flutter_app/pages/Add_Project.dart';
import 'package:flutter_app/pages/Edit_Project.dart';
//import 'package:flutter_app/pages/DpReport.dart';
import 'package:flutter_app/pages/TypesOfReport.dart';
import 'package:flutter_app/pages/drawerpage.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  //List userList1 = ['asdad', 'sqwqws' , 'dssadaa','asasadc','dsaddas','dasdqwq'];
  List<Map<String, int>> userList1 = [
    {'Sanskruti': 10},
    {'Antriksh': 15},
    {'Nakshtra': 18}
  ];
  // List userList2 = ['saaa', 'asdwqd'];
  final fkey = GlobalKey<FormState>();

  NetworkHandler p = NetworkHandler();

  // TextEditingController message = TextEditingController();
  // TextEditingController number = TextEditingController();

  // void addUserData(User user) {
  //   setState(() {
  //     userList.add(user);
  //   });
  // }

  // void showUserDialog() {
  //   showDialog(
  //       context: context,
  //       builder: (_) {
  //         return AlertDialog(
  //           content: AddUserDialog(addUserData),
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(10),
  //           ),
  //         );
  //       });
  // }


  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder<List>(
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting)
            {
              return Container(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,color: Colors.white,child: Center(child: CircularProgressIndicator(),),);
            }
            if(snapshot.hasData){

              return Scaffold(
                endDrawer: DrawerPage(),
                floatingActionButton: SizedBox(
                  width: 64,
                  height: 45,
                  child: FloatingActionButton(
                    shape:
                    BeveledRectangleBorder(borderRadius: BorderRadius.circular(5.1)),
                    backgroundColor: const Color(0xff91DEF2),
                    child: const Icon(Icons.add),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AddProjectPage()),
                      );
                    },
                  ),
                ),
                floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

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
                      alignment: const Alignment(0.94, -0.9),
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
                    Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.15,
                          bottom: MediaQuery.of(context).size.height * 0.10,
                          right: MediaQuery.of(context).size.height * 0.020,
                          left: MediaQuery.of(context).size.height * 0.020),
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
                                        top: 10,
                                        left : 120,
                                        child: InkWell(child: const Icon(Icons.edit),onTap: () {
                                          Navigator.of(context).pop();
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => EditProjectPage(newprojectName: snapshot.data![index]["project_name"].toString(), newfloors: snapshot.data![index]["floors"], newblocks: snapshot.data![index]["blocks"], ) ) );
                                        },)),
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
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TypesOfReport(
                                          projectName: snapshot.data![index]["project_name"].toString(),
                                        )));
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

        ) );
  }
}
