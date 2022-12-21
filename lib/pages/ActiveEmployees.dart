// ignore: file_names

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Server%20(Back%20End)/network_handler.dart';
import 'package:flutter_app/pages/add_project_blocks.dart';
import 'package:flutter_app/pages/notification_page.dart';

class ActiveEmployees extends StatefulWidget {
  const ActiveEmployees({Key? key}) : super(key: key);

  @override
  State<ActiveEmployees> createState() => _ActiveEmployeesState();
}

class _ActiveEmployeesState extends State<ActiveEmployees> {
  String dropdownvalue = 'Select Role';

  // List of items in our dropdown menu
  var items = [
    'All',
    'Junior Engineer',
    'Senior Engineer',
    'Project Manager',
  ];

  String b = "";

  Future<void> temp(
      String name, String designation, Map<String, dynamic> site) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black87, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 100,
          backgroundColor: const Color.fromRGBO(137, 180, 253, 1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          flex: 4,
                          child:
                              Text(name, style: const TextStyle(fontSize: 20))),
                      Expanded(
                        flex: 2,
                        child: Text(
                          designation,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: site.keys.length,
                      itemBuilder: (context, j) {
                        List<dynamic> m =
                            site.values.elementAt(j) as List<dynamic>;
                        String a = "";
                        for (var element in m) {
                          a += element + " ";
                        }
                        return Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              flex: 4,
                              child: Text(
                                site.keys.elementAt(j).toString(),
                                style: const TextStyle(fontSize: 17),
                              ),
                            ),
                            Expanded(
                                flex: 5,
                                child: Text(
                                  a,
                                  overflow: TextOverflow.visible,
                                  style: const TextStyle(fontSize: 17),
                                )),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        );
                      }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  final fkey = GlobalKey<FormState>();
  TextEditingController message = TextEditingController();
  TextEditingController number = TextEditingController();

  NetworkHandler p = NetworkHandler();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List>(
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
              backgroundColor: const Color(0xffE7EAEB),
              body: Container(
                margin: const EdgeInsets.only(top: 20),
                child: Stack(
                  children: [
                    Positioned(
                        left: 20,
                        top: 13,
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
                      top: 10,
                      child: Text(
                        "Active Employees",
                        style: TextStyle(fontSize: 30, fontFamily: 'OpenSans'),
                      ),
                    ),
                    /* const Positioned(
                      top: 14,
                      right: 24,
                      child: Icon(
                        Icons.notifications,
                        size: 30,
                        color: Colors.black38,
                      ),
                    ),*/
                    Positioned(
                      top: 10,
                      right: 20,
                      child: InkWell(
                        child: Stack(
                          children: const [
                            Icon(Icons.notifications_active_rounded,
                                color: Color.fromRGBO(
                                    45, 163, 222, 0.4588235294117647),
                                size: 30),
                            Positioned(
                              top: 1,
                              right: 1,
                              child: Icon(
                                Icons.circle,
                                size: 10,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const NotificationPage()));
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.1025,
                          left: 30),
                      //width: MediaQuery.of(context).size.width * 0.625,
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(137, 207, 253, 0.46),
                          borderRadius: BorderRadius.all(Radius.circular(6.0))),
                      child: DropdownButton2(
                        buttonWidth: MediaQuery.of(context).size.width * 0.625,
                        dropdownDecoration: const BoxDecoration(
                          color: Color.fromRGBO(
                            137,
                            207,
                            253,
                            1,
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
                        underline: Container(),

                        //icon:  Padding(padding: EdgeInsets.only(left: 20,),child: const Icon(Icons.keyboard_arrow_down),),

                        hint: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(dropdownvalue),
                        ),
                        icon: const Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Icon(Icons.keyboard_arrow_down),
                        ),

                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.175,
                          bottom: 20),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          // ignore: deprecated_member_use
                          androidOverscrollIndicator:
                              AndroidOverscrollIndicator.values[0],
                        ),
                        child: ListView.builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, i) {
                            if (snapshot.data![i]["permitted_site"].values
                                    .toString() ==
                                "none".toString()) {
                              return InkWell(
                                child: Container(
                                  // transform: Matrix4.identity(),
                                  //   duration: const Duration(milliseconds: 50),
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.04444,
                                    top: 20,
                                    right: MediaQuery.of(context).size.width *
                                        0.04444,
                                  ),
                                  padding: const EdgeInsets.only(bottom: 20),
                                  width: MediaQuery.of(context).size.width *
                                      0.9111,
                                  height: MediaQuery.of(context).size.height *
                                      0.16875,
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(137, 207, 253, 0.46),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                left: 10, right: 5),
                                            child: Icon(Icons.circle, size: 13),
                                          ),
                                          Expanded(
                                              flex: 3,
                                              child: Text(
                                                  snapshot.data![i]["username"]
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 20))),
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              snapshot.data![i]["designation"]
                                                  .toString(),
                                              style:
                                                  const TextStyle(fontSize: 15),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 50,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AddProjectBlocks(
                                                name: snapshot.data![i]
                                                        ["username"]
                                                    .toString(),
                                                designation: snapshot.data![i]
                                                        ["designation"]
                                                    .toString(),
                                                email: snapshot.data![i]
                                                        ["email"]
                                                    .toString(),
                                              )));
                                },
                              );
                            } else {
                              return GestureDetector(
                                onLongPress: () {
                                  temp(
                                      snapshot.data![i]["username"].toString(),
                                      snapshot.data![i]["designation"]
                                          .toString(),
                                      snapshot.data![i]["permitted_site"]);
                                },
                                child: Container(
                                  // transform: Matrix4.identity(),
                                  //   duration: const Duration(milliseconds: 50),
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.04444,
                                    top: 20,
                                    right: MediaQuery.of(context).size.width *
                                        0.04444,
                                  ),
                                  padding: const EdgeInsets.only(bottom: 20),
                                  width: MediaQuery.of(context).size.width *
                                      0.9111,
                                  height: MediaQuery.of(context).size.height *
                                      0.16875,
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(137, 207, 253, 0.46),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                left: 10, right: 5),
                                            child: Icon(Icons.circle, size: 13),
                                          ),
                                          Expanded(
                                              flex: 3,
                                              child: Text(
                                                  snapshot.data![i]["username"]
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 20))),
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              snapshot.data![i]["designation"]
                                                  .toString(),
                                              style:
                                                  const TextStyle(fontSize: 15),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 50,
                                          ),
                                        ],
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: snapshot
                                                    .data![i]["permitted_site"]
                                                    .length >
                                                0
                                            ? ListView.builder(
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemCount: snapshot
                                                    .data![i]["permitted_site"]
                                                    .length,
                                                itemBuilder: (context, j) {
                                                  if (snapshot
                                                          .data![i]
                                                              ["permitted_site"]
                                                          .keys
                                                          .elementAt(j)
                                                          .toString() !=
                                                      "none") {
                                                    b = snapshot.data![i]
                                                            ["email"]
                                                        .toString();
                                                    List<dynamic> m = snapshot
                                                        .data![i]
                                                            ["permitted_site"]
                                                        .values
                                                        .elementAt(
                                                            j) as List<dynamic>;

                                                    String a = "";

                                                    for (var element in m) {
                                                      a += element + " ";
                                                    }
                                                    return Row(
                                                      children: [
                                                        const SizedBox(
                                                          width: 20,
                                                        ),
                                                        Expanded(
                                                          flex: 1,
                                                          child: Text(
                                                            snapshot
                                                                .data![i][
                                                                    "permitted_site"]
                                                                .keys
                                                                .elementAt(j)
                                                                .toString(),
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        17),
                                                          ),
                                                        ),
                                                        Expanded(
                                                            flex: 2,
                                                            child: Text(
                                                              a,
                                                              overflow:
                                                                  TextOverflow
                                                                      .visible,
                                                              style: const TextStyle(
                                                                  fontSize: 17,
                                                                  color: Colors
                                                                      .black45),
                                                            )),
                                                      ],
                                                    );
                                                  } else {
                                                    return Container();
                                                  }
                                                },
                                              )
                                            : Container(),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AddProjectBlocks(
                                                name: snapshot.data![i]
                                                        ["username"]
                                                    .toString(),
                                                designation: snapshot.data![i]
                                                        ["designation"]
                                                    .toString(),
                                                email: snapshot.data![i]
                                                        ["email"]
                                                    .toString(),
                                              )));
                                },
                              );
                            }

                            //return Text(snapshot.data![i]["permitted_site"].toString());
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return const Text("Something Went Wrong");
        },
        stream: p.listActiveEmployeer({"search_by": dropdownvalue}),
      ),
    );
  }
}
