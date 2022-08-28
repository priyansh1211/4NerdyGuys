import 'package:flutter/material.dart';

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
  TextEditingController message = TextEditingController();
  TextEditingController number = TextEditingController();

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
    return Scaffold(
      floatingActionButton: SizedBox(
        width: 64,
        height: 45,
        child: FloatingActionButton(
          shape:
          BeveledRectangleBorder(borderRadius: BorderRadius.circular(5.1)),
          backgroundColor: const Color(0xff91DEF2),
          child: const Icon(Icons.add),
          onPressed: () {
            showDialog(
                barrierDismissible: true,
                context: context,
                builder: (_) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    content: Form(
                        key: fkey,
                        child: Container(
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
                                    labelText: 'Enter No. of Blocks'),
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
                                    padding: EdgeInsets.only(top: 20),
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
                                    padding: EdgeInsets.only(top: 20),
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      body: Container(
        color: Color(0xffE5E5E5),

        child: Stack(children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xffE5E5E5),
            ),
          ),
          Positioned(
              left: 20,
              top: 23,
              child: InkWell(
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                ),
                onTap: () { Navigator.of(context).pop();},
              )
          ),
          Positioned(
            left: 55,
            top: 20,
            child: Text(
              "Projects",
              style: TextStyle(fontSize: 30, fontFamily: 'OpenSans'),
            ),
          ),
          Align(
            alignment: Alignment(0.94, -0.96),
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

          Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.09,
                bottom: MediaQuery.of(context).size.height * 0.10,
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
                  margin: EdgeInsets.only(left: 15, right: 15),
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
                              TextStyle(fontSize: 18, fontFamily: 'Inter'),
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
                    onTap: () {},
                  ),
                  // child : Card(child: Center(child: Text(userList1[index].keys.elementAt(0).toString())))
                );
              },
            ),
          ),
        ]),
        // child:
      ),
      // body: SingleChildScrollView(
      //   scrollDirection: Axis.vertical,
      //   child: Row(
      //     children: [
      //       Expanded(
      //           child: ListView.builder(
      //               itemCount: userList1.length,
      //               itemBuilder: (context, i) {
      //                 return SizedBox(
      //                     height: 500,
      //                     child: Card(
      //                         child: Center(child: Text(userList1[i]))
      //                     )
      //                 );
      //               })
      //       ),
      //       Expanded(
      //           child: ListView.builder(
      //               itemCount: userList2.length,
      //               itemBuilder: (context, i) {
      //                 return SizedBox(
      //                   height: 500,
      //                   child: Card(
      //                     child: Center(child: Text(userList2[i])),
      //                   ),
      //                 );
      //               })
      //       ),
      //     ],
      //   ),
      // ),
      // body: Container(
      //   height: MediaQuery.of(context).size.height*0.85,
      //   child: ListView.builder(itemBuilder: (context,index)
      //   {
      //     return Stack(
      //       children: [
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           children: [
      //             Column(
      //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //               crossAxisAlignment: CrossAxisAlignment.center,
      //               children: [
      //                 Container(
      //                   margin: EdgeInsets.only(
      //                     top: 30
      //                   ),
      //                   height: 180,
      //                   width: 148,
      //                   child: Card(
      //                     shape: RoundedRectangleBorder(
      //                         borderRadius: BorderRadius.circular(20.0)),
      //                     elevation: 10.0,
      //                     child: ListTile(
      //                       title: Text(userList[index].username),
      //                       subtitle: Text(userList[index].email),
      //                       trailing: Text(userList[index].phoneNo),
      //
      //                     ),),
      //                 ),
      //                 VerticalDivider(width: 0),
      //
      //                 Container(
      //                   margin: EdgeInsets.only(
      //                       top: 30
      //                   ),
      //                   height: 180,
      //                   child: Card(
      //                     shape: RoundedRectangleBorder(
      //                         borderRadius: BorderRadius.circular(20.0)),
      //                     elevation: 10.0,
      //                     child: ListTile(
      //                       title: Text(userList[index+1].username),
      //                       subtitle: Text(userList[index+1].email),
      //                       trailing: Text(userList[index+1].phoneNo),
      //
      //                     ),),
      //                   width: 148,
      //                 ),
      //               ],
      //             ),
      //           ],
      //         ),
      //       ],
      //     );
      //   },
      //     itemCount: userList.length,
      //   ),
      // ),
    );
  }
}
