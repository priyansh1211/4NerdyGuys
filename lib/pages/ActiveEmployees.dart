import 'package:flutter/material.dart';
class ActiveEmployees extends StatefulWidget {
  const ActiveEmployees({Key? key}) : super(key: key);

  @override
  State<ActiveEmployees> createState() => _ActiveEmployeesState();
}

class _ActiveEmployeesState extends State<ActiveEmployees> {
  List<Map<String, int>> userList1 = [
    {'Sanskruti': 10},
    {'Antriksh': 15},
    {'Nakshtra': 18}
  ];
  final fkey = GlobalKey<FormState>();
  TextEditingController message = TextEditingController();
  TextEditingController number = TextEditingController();

  get i => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: SizedBox(
      //   width: 64,
      //   height: 45,
      //   child:
      // ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: const Color(0xffE7EAEB),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xffE7EAEB),
        title: const Text(
          "Active Employees",
          style: TextStyle(color: Colors.black),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            width: 328,
            height: 150,
            padding: const EdgeInsets.all(5),
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: const Color(0xff89CFFD),
                elevation: 12,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Icon(Icons.circle),
                          flex: 1,
                        ),
                        Expanded(child: Text("VISHWAS BHATT"), flex: 3),
                        Expanded(
                          flex: 2,
                          child: FloatingActionButton(
                            shape:
                            BeveledRectangleBorder(borderRadius: BorderRadius.circular(5.1)),
                            backgroundColor: const Color(0xff89CFFD),
                            child: Row(
                              children: [Icon(Icons.add), Text("New site")],
                            ),
                            onPressed: () {
                              showDialog(
                                  barrierDismissible: true,
                                  context: context,
                                  builder: (_) {
                                    return AlertDialog(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                      content: Form(
                                          key: fkey,
                                          child: SizedBox(
                                            width: 100,
                                            height: 200,
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  decoration: const InputDecoration(
                                                      labelText: 'Enter Site Name'),
                                                  controller: message,
                                                  validator: (value) {
                                                    if (value == null || value.isEmpty) {
                                                      return "Enter Something";
                                                    }
                                                    return null;
                                                  },
                                                ),
                                                TextFormField(
                                                  decoration: const InputDecoration(
                                                      labelText: 'Enter The Block Number'),
                                                  controller: number,
                                                  validator: (value) {
                                                    if (value == null || value.isEmpty) {
                                                      return "Enter Number";
                                                    }
                                                    return null;
                                                  },
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 20),
                                                      child: ElevatedButton(
                                                        onPressed: () {
                                                          if (fkey.currentState!.validate()) {
                                                            userList1.add({
                                                              message.text: int.parse(number.text)
                                                            });
                                                            Navigator.pop(context);
                                                            number.clear();
                                                            message.clear();
                                                            setState(() {});
                                                          }
                                                        },
                                                        child: const Text('Add'),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 20),
                                                      child: ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.pop(context);
                                                        },
                                                        child: const Text('Cancel'),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )),
                                    );
                                  });
                            },
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 125),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Sanskruti"),
                              Text("B"),
                            ],
                          ), Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Sanskruti"),
                              Text("B"),
                            ],
                          ), Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Sanskruti"),
                              Text("B"),
                            ],
                          ),],
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
