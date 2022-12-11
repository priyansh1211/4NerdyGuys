import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Server%20(Back%20End)/network_handler.dart';
import 'package:flutter_app/pages/add_project_blocks.dart';

class ActiveEmployees extends StatefulWidget {
  const ActiveEmployees({Key? key}) : super(key: key);

  @override
  State<ActiveEmployees> createState() => _ActiveEmployeesState();
}

class _ActiveEmployeesState extends State<ActiveEmployees> {
  List userList = [
    'Vishwaas',
    'Vishwaas12',
    'Vishwaas13',
    'Vishwaas14',
    'Abc',
    'Abc12',
    'Abc13',
    'Abc14',
    'XYZ',
    'XYZ12',
    'XYZ13',
    'XYZ14'
  ];

  List<Map<String, dynamic>> userList1 = [
    {'Sanskruti': 'A'},
    {'Antriksh': 'C'},
    {'Nakshtra': 'B'}
  ];

  List<Map<String, dynamic>> userRole = [
    {'Junior Engineer': 'Vishwaas'},
    {'Junior Engineer': 'Vishwaas12'},
    {'Junior Engineer': 'Vishwaas13'},
    {'Junior Engineer': 'Vishwaas14'},
    {'Senior Engineer': 'Abc'},
    {'Senior Engineer': 'Abc12'},
    {'Senior Engineer': 'Abc13'},
    {'Senior Engineer': 'Abc14'},
    {'Project Manager': 'XYZ'},
    {'Project Manager': 'XYZ12'},
    {'Project Manager': 'XYZ13'},
    {'Project Manager': 'XYZ14'},
  ];

  String dropdownvalue = 'Select Role';

  // List of items in our dropdown menu
  var items = [
    'Junior Engineer',
    'Senior Engineer',
    'Project Manager',
  ];

  String b = "";

  final fkey = GlobalKey<FormState>();
  TextEditingController message = TextEditingController();
  TextEditingController number = TextEditingController();
  int inc = 0;

  NetworkHandler p = NetworkHandler();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.1025 - 20,
                          left: 30),
                      width: MediaQuery.of(context).size.width * 0.625,
                      decoration: const BoxDecoration(
                          color: Color(0xff89CFFD),
                          borderRadius: BorderRadius.all(Radius.circular(6.0))),
                      child: DropdownButton2(
                        dropdownDecoration:
                            const BoxDecoration(color: Color(0xff89CFFD)),
                        style: const TextStyle(color: Colors.black),
                        underline: Container(),
                        icon: Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.25 -
                                  dropdownvalue.length -
                                  10),
                          child: const Icon(Icons.keyboard_arrow_down),
                        ),
                        hint: Text(dropdownvalue),
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(items),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                            userList = [];
                            if (newValue.toString() != 'Select Role') {
                              for (int i = 0; i < userRole.length; i++) {
                                if (userRole[i].keys.elementAt(0).toString() ==
                                    newValue.toString()) {
                                  userList.add(userRole[i]
                                      .values
                                      .elementAt(0)
                                      .toString());
                                }
                              }
                            }
                          });
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 150, bottom: 20),
                      child: ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, i) {
                          return InkWell(
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width *
                                      0.04444,
                                  top: 20,
                                  right: MediaQuery.of(context).size.width *
                                      0.04444,
                                ),
                                width:
                                    MediaQuery.of(context).size.width * 0.9111,
                                height: MediaQuery.of(context).size.height *
                                        0.16875 +
                                    snapshot.data![i].length * 2,
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(137, 207, 253, 0.46),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.circle, size: 15),
                                        Text(snapshot.data![i]["username"]
                                            .toString()),
                                        Text(snapshot.data![i]["designation"]
                                            .toString()),
                                      ],
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                          itemCount: snapshot
                                              .data![i]["permitted_site"]
                                              .length,
                                          itemBuilder: (context, j) {
                                            b = snapshot.data![i]["email"].toString();
                                            List<dynamic> m = snapshot
                                                .data![i]["permitted_site"]
                                                .values
                                                .elementAt(j) as List<dynamic>;
                                            String a = "";
                                            for (var element in m) {
                                              a += element + " ";
                                            }
                                            return Row(
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    snapshot
                                                        .data![i]
                                                            ["permitted_site"]
                                                        .keys
                                                        .elementAt(j)
                                                        .toString(),
                                                  ),
                                                ),
                                                Expanded(
                                                    flex: 3,
                                                    child: Text(
                                                      a,
                                                      overflow:
                                                          TextOverflow.visible,
                                                    )),
                                              ],
                                            );
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddProjectBlocks(
                                              name: snapshot.data![i]["email"]
                                                  .toString(),
                                            )));
                              });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return const Text("Something Went Wrong");
        },
        future: p.listActiveEmployeers(),
      ),
    );
  }
}
