import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_app/pages/DesignRequirement.dart';
import 'package:get/get.dart';
class MaterialReport extends StatefulWidget {
  const MaterialReport({Key? key}) : super(key: key);

  @override
  State<MaterialReport> createState() => _MaterialReportState();
}

class _MaterialReportState extends State<MaterialReport> {
  final List<String> items = [
    'Add new column',
  ];

  String? selectedValue;

  List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> items) {
    List<DropdownMenuItem<String>> menuItems = [];
    for (var item in items) {
      menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
          //If it's last item, we will not add Divider after it.
          if (item != items.last)
            const DropdownMenuItem<String>(
              enabled: false,
              child: Divider(),
            ),
        ],
      );
    }
    return menuItems;
  }

  List<int> getDividersIndexes() {
    List<int> dividersIndexes = [];
    for (var i = 0; i < (items.length * 2) - 1; i++) {
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        dividersIndexes.add(i);
      }
    }
    return dividersIndexes;
  }

  List<String> column_name =['Remarks'];
  int number = 1;
  final fkey = GlobalKey<FormState>();
  TextEditingController message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xffE5E5E5),
        title: const Text(
          "Material Report:",
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
                ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            OutlinedButton(
                onPressed: () {
                  {
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
                                            labelText: 'Enter Column Name'),
                                        controller: message,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Enter Something";
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
                                                  column_name.add(message.text);
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
                  }
                },
                child: const Text("Add a column")),
            SizedBox(height: 20,),
            const SizedBox(height: 10,),
            Padding(
                padding: const EdgeInsets.only(right: 230),
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(text: 'Item',style: TextStyle(color: Colors.black, fontSize: 20)),
                      WidgetSpan(child: SizedBox(width: MediaQuery.of(context).devicePixelRatio,)),
                      const WidgetSpan(child: Icon(Icons.more_horiz)),
                      // TextSpan(text: 'to add'),
                    ],
                  ),
                )
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: 50,
                margin: const EdgeInsets.only(right: 100),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(right: 170),
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(text: 'Description',style: TextStyle(color: Colors.black, fontSize: 20)),
                      WidgetSpan(child: SizedBox(width: MediaQuery.of(context).devicePixelRatio,)),
                      const WidgetSpan(child: Icon(Icons.more_horiz)),
                      // TextSpan(text: 'to add'),
                    ],
                  ),
                )
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                padding: const EdgeInsets.only(left: 20),
                height: 50,
                margin: const EdgeInsets.only(right: 100),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: '-Give Work Description-',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            //SizedBox(height: 10,),
            Padding(
                padding: const EdgeInsets.only(right: 220),
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(text: 'Status',style: TextStyle(color: Colors.black, fontSize: 20)),
                      WidgetSpan(child: SizedBox(width: MediaQuery.of(context).devicePixelRatio,)),
                      const WidgetSpan(child: Icon(Icons.more_horiz)),
                      // TextSpan(text: 'to add'),
                    ],
                  ),
                )
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                padding: const EdgeInsets.only(left: 20),
                height: 55,
                margin: const EdgeInsets.only(right: 100),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: '-Select Work Status',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            //SizedBox(height: 10,),
            // Padding(
            //     padding: const EdgeInsets.only(right: 190),
            //     child: Text.rich(
            //       TextSpan(
            //         children: [
            //           const TextSpan(
            //               text: 'Remarks',
            //               style: TextStyle(
            //                   color: Colors.black, fontSize: 20)),
            //           WidgetSpan(
            //               child: SizedBox(
            //                 width:
            //                 MediaQuery.of(context).devicePixelRatio,
            //               )),
            //           const WidgetSpan(child: Icon(Icons.more_horiz)),
            //           // TextSpan(text: 'to add'),
            //         ],
            //       ),
            //     )),
            // Padding(
            //   padding: const EdgeInsets.all(20),
            //   child: Container(
            //     padding: const EdgeInsets.only(left: 12),
            //     height: 50,
            //     margin: const EdgeInsets.only(right: 100),
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(20),
            //     ),
            //     child: const TextField(
            //       decoration: InputDecoration(
            //         border: InputBorder.none,
            //       ),
            //     ),
            //   ),
            // ),
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
                                    text:column_name[i].toString(),
                                    style: TextStyle(
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
                                  builder: (context) =>
                                  const DesignRequirement()));
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
