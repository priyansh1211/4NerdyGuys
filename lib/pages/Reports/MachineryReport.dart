import 'package:flutter/material.dart';
import 'package:flutter_app/pages/Reports/WorkDoneToday.dart';
import 'package:get/get.dart';

class MachineryReport extends StatefulWidget {
  const MachineryReport({Key? key}) : super(key: key);

  @override
  State<MachineryReport> createState() => _MachineryReportState();
}

class _MachineryReportState extends State<MachineryReport> {
  List<String> Blocks = ['A', 'B', 'C', 'D', 'E', 'F'];

  String selectedValue = "Select a block";

  // List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> items) {
  //   List<DropdownMenuItem<String>> menuItems = [];
  //   for (var item in items) {
  //     menuItems.addAll(
  //       [
  //         DropdownMenuItem<String>(
  //           value: item,
  //           child: Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 8.0),
  //             child: Text(
  //               item,
  //               style: const TextStyle(
  //                 fontSize: 14,
  //               ),
  //             ),
  //           ),
  //         ),
  //         //If it's last item, we will not add Divider after it.
  //         if (item != items.last)
  //           const DropdownMenuItem<String>(
  //             enabled: false,
  //             child: Divider(),
  //           ),
  //       ],
  //     );
  //   }
  //   return menuItems;
  // }

  /*List<int> _getDividersIndexes() {
    List<int> dividersIndexes = [];
    for (var i = 0; i < (items.length * 2) - 1; i++) {
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        dividersIndexes.add(i);
      }
    }
    return dividersIndexes;
  }*/

  //String? _chosenValue;
  List<String> column_name = ['Remarks'];

  List<String> Agency_name = [''];

  List<String> WorkDescription_name = [''];

  int number = 1;
  int number_agency = 1;
  int number_work = 1;
  final fkey = GlobalKey<FormState>();

  //final fkey_agency=GlobalKey<FormState>();
  TextEditingController message = TextEditingController();
  TextEditingController msg_agency = TextEditingController();
  TextEditingController msg_work = TextEditingController();
  TextEditingController number1 = TextEditingController();
  TextEditingController number2 = TextEditingController();

  final Agency = TextEditingController();

  String resulttext = "0";

  // List<String> column_name =['Remarks'];
  // int number = 1;
  // final fkey = GlobalKey<FormState>();
  // TextEditingController message = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xffE5E5E5),
        title: const Text(
          "Machinery Report:",
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
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
                onTap: () {},
                child: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 30,
                    color: Colors.blue,
                  ),
                )),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  width: 10,
                ),
                OutlinedButton(
                    onPressed: () {
                      {
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
                                            decoration: const InputDecoration(
                                                labelText: 'Enter Column Name'),
                                            controller: message,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "Enter Something";
                                              }
                                              return null;
                                            },
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 20),
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    if (fkey.currentState!
                                                        .validate()) {
                                                      column_name
                                                          .add(message.text);
                                                      Navigator.pop(context);
                                                      message.clear();
                                                      setState(() {
                                                        number = number + 1;
                                                      });
                                                    }
                                                  },
                                                  child: const Text('Add'),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 20),
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
                      }
                    },
                    child: const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: 'Add a column',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20)),
                          WidgetSpan(child: Icon(Icons.add)),
                          // TextSpan(text: 'to add'),
                        ],
                      ),
                    )),
                const SizedBox(
                  width: 10,
                ),
                DropdownButton(
                  hint: Text(selectedValue),
                  // value: selectedValue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: Blocks.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue = newValue!;
                      //selectedValue=newValue!;
                    });
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: () {
                {
                  setState(() {
                    number_agency = number_agency + 1;
                  });
                }
              },
              child: const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'Agency',
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                    WidgetSpan(child: Icon(Icons.add)),
                    // TextSpan(text: 'to add'),
                  ],
                ),
              ),
            ),
            // Padding(
            //     padding: const EdgeInsets.only(right: 210),
            //     child: Text.rich(
            //       TextSpan(
            //         children: [
            //           const TextSpan(
            //               text: 'Agency',
            //               style: TextStyle(color: Colors.black, fontSize: 20)),
            //           WidgetSpan(
            //               child: SizedBox(
            //                 width: MediaQuery.of(context).devicePixelRatio,
            //               )),
            //           const WidgetSpan(child: Icon(Icons.add_circle_outline)),
            //           // TextSpan(text: 'to add'),
            //         ],
            //       ),
            //     )),
            // Padding(
            //   padding: const EdgeInsets.all(20),
            //   child: Container(
            //     padding: const EdgeInsets.only(left: 20),
            //     height: 50,
            //     margin: const EdgeInsets.only(right: 150),
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(20),
            //     ),
            //     child: const TextField(
            //       decoration: InputDecoration(
            //         // hintText: '-Give Work Description-',
            //         border: InputBorder.none,
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //     padding: const EdgeInsets.only(right: 170),
            //     child: Text.rich(
            //       TextSpan(
            //         children: [
            //           const TextSpan(
            //               text: 'Description',
            //               style: TextStyle(color: Colors.black, fontSize: 20)),
            //           WidgetSpan(
            //               child: SizedBox(
            //                 width: MediaQuery.of(context).devicePixelRatio,
            //               )),
            //           const WidgetSpan(child: Icon(Icons.more_horiz)),
            //           // TextSpan(text: 'to add'),
            //         ],
            //       ),
            //     )),
            // Padding(
            //   padding: const EdgeInsets.all(20),
            //   child: Container(
            //     padding: const EdgeInsets.only(left: 20),
            //     height: 50,
            //     margin: const EdgeInsets.only(right: 100),
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(20),
            //     ),
            //     child: const TextField(
            //       decoration: InputDecoration(
            //         hintText: '-Give Work Description-',
            //         border: InputBorder.none,
            //       ),
            //     ),
            //   ),
            // ),
            // //SizedBox(height: 10,),
            // Padding(
            //     padding: const EdgeInsets.only(right:220),
            //     child: Text.rich(
            //       TextSpan(
            //         children: [
            //           const TextSpan(
            //               text: 'Skilled',
            //               style: TextStyle(color: Colors.black, fontSize: 20)),
            //           WidgetSpan(
            //               child: SizedBox(
            //                 width: MediaQuery.of(context).devicePixelRatio,
            //               )),
            //           const WidgetSpan(child: Icon(Icons.more_horiz)),
            //           // TextSpan(text: 'to add'),
            //         ],
            //       ),
            //     )),
            // Padding(
            //   padding: const EdgeInsets.all(20),
            //   child: Container(
            //     padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
            //     height: 55,
            //     margin: const EdgeInsets.only(right: 260),
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(20),
            //     ),
            //     child: TextField(
            //       controller: number1,
            //       autocorrect: true,
            //       keyboardType: TextInputType.number,
            //       decoration: const InputDecoration(
            //         hintText: '1',
            //         border: InputBorder.none,
            //       ),
            //     ),
            //   ),
            // ),
            // //SizedBox(height: 10,),
            // Padding(
            //     padding: const EdgeInsets.only(right: 200),
            //     child: Text.rich(
            //       TextSpan(
            //         children: [
            //           const TextSpan(
            //               text: 'Unskilled',
            //               style: TextStyle(color: Colors.black, fontSize: 20)),
            //           WidgetSpan(
            //               child: SizedBox(
            //                 width: MediaQuery.of(context).devicePixelRatio,
            //               )),
            //           const WidgetSpan(child: Icon(Icons.more_horiz)),
            //           // TextSpan(text: 'to add'),
            //         ],
            //       ),
            //     )),
            // Padding(
            //   padding: const EdgeInsets.all(20),
            //   child: Container(
            //     padding: const EdgeInsets.only(left: 10, top: 8, bottom: 8),
            //     height: 55,
            //     margin: const EdgeInsets.only(right: 260),
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(20),
            //     ),
            //     child: TextField(
            //       controller: number2,
            //       autocorrect: true,
            //       keyboardType: TextInputType.number,
            //       decoration: const InputDecoration(
            //         hintText: '1',
            //         border: InputBorder.none,
            //       ),
            //     ),
            //   ),
            // ),
            // //SizedBox(height: 10,),
            // // Padding(
            // //     padding: const EdgeInsets.only(right: 190),
            // //     child: Text.rich(
            // //       TextSpan(
            // //         children: [
            // //           const TextSpan(
            // //               text: 'Remarks',
            // //               style: TextStyle(
            // //                   color: Colors.black, fontSize: 20)),
            // //           WidgetSpan(
            // //               child: SizedBox(
            // //                 width:
            // //                 MediaQuery.of(context).devicePixelRatio,
            // //               )),
            // //           const WidgetSpan(child: Icon(Icons.more_horiz)),
            // //           // TextSpan(text: 'to add'),
            // //         ],
            // //       ),
            // //     )),
            // // Padding(
            // //   padding: const EdgeInsets.all(20),
            // //   child: Container(
            // //     padding: const EdgeInsets.only(left: 12),
            // //     height: 50,
            // //     margin: const EdgeInsets.only(right: 100),
            // //     decoration: BoxDecoration(
            // //       color: Colors.white,
            // //       borderRadius: BorderRadius.circular(20),
            // //     ),
            // //     child: const TextField(
            // //       decoration: InputDecoration(
            // //         border: InputBorder.none,
            // //       ),
            // //     ),
            // //   ),
            // // ),
            //agency listview.builder
            ListView.builder(
              physics: const ScrollPhysics(parent: null),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int i) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(right: 210),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                const TextSpan(
                                    text: 'Agency',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20)),
                                WidgetSpan(
                                    child: SizedBox(
                                  width:
                                      MediaQuery.of(context).devicePixelRatio,
                                )),
                                const WidgetSpan(child: Icon(Icons.add_sharp)),
                                // TextSpan(text: 'to add'),
                              ],
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          padding: const EdgeInsets.only(left: 20),
                          height: 50,
                          margin: const EdgeInsets.only(right: 150),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              // hintText: '-Give Work Description-',
                              border: InputBorder.none,
                            ),
                            controller: Agency,
                            onChanged: (text) {
                              Agency_name.add(text);
                            },
                          ),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          {
                            setState(() {
                              number_work = number_work + 1;
                            });
                          }
                        },
                        child: const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Work Description',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20)),
                              WidgetSpan(child: Icon(Icons.add)),
                              // TextSpan(text: 'to add'),
                            ],
                          ),
                        ),
                      ),
                      // ListView.builder(
                      //   physics: ScrollPhysics(parent: null),
                      //   shrinkWrap: true,
                      //   itemBuilder: (BuildContext context,int i){
                      //     return Column(
                      //       children: [
                      //         Padding(
                      //           padding: const EdgeInsets.all(20),
                      //           child: Container(
                      //             padding: const EdgeInsets.only(left: 20),
                      //             height: 50,
                      //             margin: const EdgeInsets.only(right: 100),
                      //             decoration: BoxDecoration(
                      //               color: Colors.white,
                      //               borderRadius: BorderRadius.circular(20),
                      //             ),
                      //             child: const TextField(
                      //               decoration: InputDecoration(
                      //                 hintText: '-Give Work Description-',
                      //                 border: InputBorder.none,
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //         //SizedBox(height: 10,),
                      //         Padding(
                      //             padding: const EdgeInsets.only(right:220),
                      //             child: Text.rich(
                      //               TextSpan(
                      //                 children: [
                      //                   const TextSpan(
                      //                       text: 'Skilled',
                      //                       style: TextStyle(color: Colors.black, fontSize: 20)),
                      //                   WidgetSpan(
                      //                       child: SizedBox(
                      //                         width: MediaQuery.of(context).devicePixelRatio,
                      //                       )),
                      //                   // const WidgetSpan(child: Icon(Icons.more_horiz)),
                      //                   // TextSpan(text: 'to add'),
                      //                 ],
                      //               ),
                      //             ),
                      //         ),
                      //         Padding(
                      //           padding: const EdgeInsets.all(20),
                      //           child: Container(
                      //             padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                      //             height: 55,
                      //             margin: const EdgeInsets.only(right: 260),
                      //             decoration: BoxDecoration(
                      //               color: Colors.white,
                      //               borderRadius: BorderRadius.circular(20),
                      //             ),
                      //             child: TextField(
                      //               controller: number1,
                      //               autocorrect: true,
                      //               keyboardType: TextInputType.number,
                      //               decoration: const InputDecoration(
                      //                 hintText: '1',
                      //                 border: InputBorder.none,
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //         //SizedBox(height: 10,),
                      //         Padding(
                      //             padding: const EdgeInsets.only(right: 200),
                      //             child: Text.rich(
                      //               TextSpan(
                      //                 children: [
                      //                   const TextSpan(
                      //                       text: 'Unskilled',
                      //                       style: TextStyle(color: Colors.black, fontSize: 20)),
                      //                   WidgetSpan(
                      //                       child: SizedBox(
                      //                         width: MediaQuery.of(context).devicePixelRatio,
                      //                       )),
                      //                   //const WidgetSpan(child: Icon(Icons.more_horiz)),
                      //                   // TextSpan(text: 'to add'),
                      //                 ],
                      //               ),
                      //             )),
                      //         Padding(
                      //           padding: const EdgeInsets.all(20),
                      //           child: Container(
                      //             padding: const EdgeInsets.only(left: 10, top: 8, bottom: 8),
                      //             height: 55,
                      //             margin: const EdgeInsets.only(right: 260),
                      //             decoration: BoxDecoration(
                      //               color: Colors.white,
                      //               borderRadius: BorderRadius.circular(20),
                      //             ),
                      //             child: TextField(
                      //               controller: number2,
                      //               autocorrect: true,
                      //               keyboardType: TextInputType.number,
                      //               decoration: const InputDecoration(
                      //                 hintText: '1',
                      //                 border: InputBorder.none,
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //         Padding(
                      //             padding: const EdgeInsets.only(right:220),
                      //             child: Text.rich(
                      //               TextSpan(
                      //                 children: [
                      //                   const TextSpan(
                      //                       text: 'Total',
                      //                       style: TextStyle(color: Colors.black, fontSize: 20)),
                      //                   WidgetSpan(
                      //                       child: SizedBox(
                      //                         width: MediaQuery.of(context).devicePixelRatio,
                      //                       )),
                      //                  // const WidgetSpan(child: Icon(Icons.more_horiz)),
                      //                   // TextSpan(text: 'to add'),
                      //                 ],
                      //               ),
                      //             )),
                      //         SizedBox(height: 10,),
                      //         Container(
                      //           padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.04),
                      //           height: 62,
                      //           margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.775),
                      //           child: FloatingActionButton(
                      //             onPressed: (){
                      //               setState(() {
                      //                 int total = int.parse(number1.text)+int.parse(number2.text);
                      //                 resulttext = total.toString();
                      //               });
                      //             },
                      //             child: Text(resulttext,style: TextStyle(color: Colors.black),),
                      //             backgroundColor: Colors.white,
                      //             isExtended: true,
                      //
                      //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      //             elevation: 0,
                      //           ),
                      //           // padding: EdgeInsets.only(right: 0),
                      //         ),
                      //         SizedBox(height: 10,),
                      //       ],
                      //     );
                      //   },
                      //   itemCount: number_work,
                      // ),
                    ],
                  ),
                );
              },
              itemCount: number_agency,
            ),
            //column listview.builder
            ListView.builder(
              physics: const ScrollPhysics(parent: null),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int i) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(right: 200),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: column_name[i].toString(),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 20)),
                                WidgetSpan(
                                    child: SizedBox(
                                  width:
                                      MediaQuery.of(context).devicePixelRatio,
                                )),
                                const WidgetSpan(child: Icon(Icons.more_horiz)),
                                // TextSpan(text: 'to add'),
                              ],
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          padding: const EdgeInsets.only(left: 12),
                          height: 50,
                          margin: const EdgeInsets.only(right: 100),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: number,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.defaultDialog(
                        middleText: "Do you want to continue?",
                        titleStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'ReadexPro',
                            fontSize: 15),
                        middleTextStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'ReadexPro',
                            fontSize: 15),
                        textCancel: "NO",
                        cancelTextColor: const Color(0xff685D5D),
                        textConfirm: "YES",
                        confirmTextColor: Colors.lightGreenAccent,
                        radius: 40,
                        buttonColor: const Color(0xff685D5D),
                        //barrierDismissible: false,
                        backgroundColor: const Color(0xff009AFF),
                        onConfirm: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WorkDoneToday()));
                        },
                      );
                    },
                    child: const Text(
                      "Make Report",
                      // style: TextStyle(
                      //     color: Colors.white,
                      //     fontWeight: FontWeight.bold,
                      //     fontFamily: 'ReadexPro',
                      //     fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
