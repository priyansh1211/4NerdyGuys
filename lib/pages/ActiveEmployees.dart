import 'package:flutter/material.dart';

class ActiveEmployees extends StatefulWidget {
  const ActiveEmployees({Key? key}) : super(key: key);

  @override
  State<ActiveEmployees> createState() => _ActiveEmployeesState();
}

class _ActiveEmployeesState extends State<ActiveEmployees> {
  List<Map<String, String>> userList1 = [
    {'Sanskruti': 'A'},
    {'Antriksh': 'C'},
    {'Nakshtra': 'B'}
  ];
  final fkey = GlobalKey<FormState>();
  TextEditingController message = TextEditingController();
  TextEditingController number = TextEditingController();
  int inc = 0;

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
      body: Container(
        margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.04444, top: 20),
        width: MediaQuery.of(context).size.width * 0.9111,
        height: MediaQuery.of(context).size.height * 0.16875 + inc,
        decoration: const BoxDecoration(
          color: Color(0xff89CFFD),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 5,
              child: Row(
                children:  [
                  const Icon(Icons.circle),
                  const Text("Vishwas Bhatt"),
                  Container(
                    margin: const EdgeInsets.only(left: 110),
                    width: 30,
                    height: 30,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: FloatingActionButton(
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(5.1)),
                        backgroundColor: const Color(0xff89CFFD),
                        child: const Icon(Icons.add),

                        onPressed: () {
                          showDialog(
                              barrierDismissible: true,
                              context: context,
                              builder: (_) {
                                return AlertDialog(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                  content: Form(
                                      key: fkey,
                                      child: SizedBox(
                                        width: 100,
                                        height: 200,
                                        child: Column(
                                          children: [
                                            TextFormField(
                                              decoration:
                                              const InputDecoration(
                                                  labelText:
                                                  'Enter Site Name'),
                                              controller: message,
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return "Enter Something";
                                                }
                                                return null;
                                              },
                                            ),
                                            TextFormField(
                                              decoration: const InputDecoration(
                                                  labelText:
                                                  'Enter The Block Number'),
                                              controller: number,
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return "Enter Number";
                                                }
                                                return null;
                                              },
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceAround,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 20),
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      if (fkey.currentState!
                                                          .validate()) {
                                                        userList1.add({
                                                          message.text: number.text
                                                        });
                                                        Navigator.pop(
                                                            context);
                                                        number.clear();
                                                        message.clear();
                                                        inc = inc + 20;
                                                        setState(() {});
                                                      }
                                                    },
                                                    child:
                                                    const Text('Add'),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 20),
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.pop(
                                                          context);
                                                    },
                                                    child: const Text(
                                                        'Cancel'),
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
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: const EdgeInsets.only(top: 85),
              child: ListView.builder(
                  itemCount: userList1.length,
                  itemBuilder: (context, j) {
                    return Container(
                      margin: const EdgeInsets.only(right: 125),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(userList1[j].keys.elementAt(0).toString()),
                              Text(userList1[j].values.elementAt(0).toString()),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),),

          ],
        ),
      ),
      // body: ListView(
      //   children: [
      //     Container(
      //       width: 328,
      //       height: 150,
      //       padding: const EdgeInsets.all(5),
      //       child: Card(
      //           shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(15),
      //           ),
      //           color: const Color(0xff89CFFD),
      //           elevation: 12,
      //           child: Column(
      //             children: [
      //               Row(
      //                 children: [
      //                   const Expanded(
      //                     flex: 1,
      //                     child: Icon(Icons.circle),
      //                   ),
      //                   const Expanded(flex: 3, child: Text("VISHWAS BHATT")),
      //                   Expanded(
      //                     flex: 2,
      //                     child: FloatingActionButton(
      //                       shape: BeveledRectangleBorder(
      //                           borderRadius: BorderRadius.circular(5.1)),
      //                       backgroundColor: const Color(0xff89CFFD),
      //                       child: Row(
      //                         children: const [
      //                           Icon(Icons.add),
      //                           Text("New site")
      //                         ],
      //                       ),
      //                       onPressed: () {
      //                         showDialog(
      //                             barrierDismissible: true,
      //                             context: context,
      //                             builder: (_) {
      //                               return AlertDialog(
      //                                 shape: const RoundedRectangleBorder(
      //                                     borderRadius: BorderRadius.all(
      //                                         Radius.circular(10.0))),
      //                                 content: Form(
      //                                     key: fkey,
      //                                     child: SizedBox(
      //                                       width: 100,
      //                                       height: 200,
      //                                       child: Column(
      //                                         children: [
      //                                           TextFormField(
      //                                             decoration:
      //                                                 const InputDecoration(
      //                                                     labelText:
      //                                                         'Enter Site Name'),
      //                                             controller: message,
      //                                             validator: (value) {
      //                                               if (value == null ||
      //                                                   value.isEmpty) {
      //                                                 return "Enter Something";
      //                                               }
      //                                               return null;
      //                                             },
      //                                           ),
      //                                           TextFormField(
      //                                             decoration: const InputDecoration(
      //                                                 labelText:
      //                                                     'Enter The Block Number'),
      //                                             controller: number,
      //                                             validator: (value) {
      //                                               if (value == null ||
      //                                                   value.isEmpty) {
      //                                                 return "Enter Number";
      //                                               }
      //                                               return null;
      //                                             },
      //                                           ),
      //                                           Row(
      //                                             mainAxisAlignment:
      //                                                 MainAxisAlignment
      //                                                     .spaceAround,
      //                                             crossAxisAlignment:
      //                                                 CrossAxisAlignment.end,
      //                                             children: [
      //                                               Padding(
      //                                                 padding:
      //                                                     const EdgeInsets.only(
      //                                                         top: 20),
      //                                                 child: ElevatedButton(
      //                                                   onPressed: () {
      //                                                     if (fkey.currentState!
      //                                                         .validate()) {
      //                                                       userList1.add({
      //                                                         message.text:
      //                                                             int.parse(
      //                                                                 number
      //                                                                     .text)
      //                                                       });
      //                                                       Navigator.pop(
      //                                                           context);
      //                                                       number.clear();
      //                                                       message.clear();
      //                                                       setState(() {});
      //                                                     }
      //                                                   },
      //                                                   child:
      //                                                       const Text('Add'),
      //                                                 ),
      //                                               ),
      //                                               Padding(
      //                                                 padding:
      //                                                     const EdgeInsets.only(
      //                                                         top: 20),
      //                                                 child: ElevatedButton(
      //                                                   onPressed: () {
      //                                                     Navigator.pop(
      //                                                         context);
      //                                                   },
      //                                                   child: const Text(
      //                                                       'Cancel'),
      //                                                 ),
      //                                               )
      //                                             ],
      //                                           ),
      //                                         ],
      //                                       ),
      //                                     )),
      //                               );
      //                             });
      //                       },
      //                     ),
      //                   )
      //                 ],
      //               ),
      //               ListView.builder(
      //                   itemCount: userList1.length,
      //                   itemBuilder: (context, j) {
      //                     return Container(
      //                       margin: const EdgeInsets.only(right: 125),
      //                       child: Column(
      //                         children: [
      //                           Row(
      //                             mainAxisAlignment:
      //                                 MainAxisAlignment.spaceEvenly,
      //                             children: [
      //                               Text(userList1[j]
      //                                   .keys
      //                                   .elementAt(0)
      //                                   .toString()),
      //                               const Text("B"),
      //                             ],
      //                           ),
      //                         ],
      //                       ),
      //                     );
      //                   })
      //             ],
      //           )),
      //     ),
      //   ],
      // ),
    );
  }
}
