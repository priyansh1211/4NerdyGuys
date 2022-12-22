// ignore_for_file: must_be_immutable

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Server%20(Back%20End)/network_handler.dart';
import 'package:flutter_app/pages/Project/second_project_blocks.dart';

class AddProjectBlocks extends StatefulWidget {
  String name = "";

  AddProjectBlocks({Key? key, required this.name}) : super(key: key);

  @override
  State<AddProjectBlocks> createState() => _AddProjectBlocksState();
}

class _AddProjectBlocksState extends State<AddProjectBlocks> {
  String dropdownvalue = 'Select Role';

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

  // List of items in our dropdown menu

  NetworkHandler p = NetworkHandler();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List>(
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
          List<String> items = [];
          List<String> val = [];
          snapshot.data?.forEach((element) {
            items.add(element["project_name"].toString());
            val.add(element["blocks"].toString());
          });
          final Map<String, String> z = Map.fromIterables(items, val);

          List<String> newblocks = [];

          return Scaffold(
            body: Stack(
              children: [
                Container(
                  color: const Color(0xffE5E5E5),
                ),

                // const Positioned(
                //   top: 35,
                //   left: 50,
                //   child: Text('Add Project',
                //       style: TextStyle(
                //           fontSize: 30, fontWeight: FontWeight.bold)),
                // ),

                ListView(
                  children: [
                    Column(
                      children: [
                        Container(
                          //MediaQuery.of(context).size.width * 0.9111,
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.10875,
                              left: MediaQuery.of(context).size.width * 0.04444,
                              right:
                                  MediaQuery.of(context).size.width * 0.04444),
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.055,
                              left: 30,
                              right: 30,
                              bottom:
                                  MediaQuery.of(context).size.height * 0.03625),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: const Color(0xff89CFFD),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              DropdownButton2(
                                dropdownDecoration: const BoxDecoration(
                                    color: Color(0xff89CFFD)),
                                style: const TextStyle(color: Colors.black),
                                underline: Container(),
                                icon: Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                              0.25 -
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
                                    for (int i = 65;
                                        i < int.parse(z[dropdownvalue]!) + 65;
                                        i++) {
                                      newblocks.add(String.fromCharCode(i));
                                    }
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SecondProjectBlocks(
                                                  index: newblocks,
                                                  projectName: dropdownvalue,
                                                  email: widget.name.toString(),
                                                )));
                                  });
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.075,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        }

        return const Text("Something Went Wrong");
      },
      stream: p.listforActiveDropDown(),
    );
  }
}
