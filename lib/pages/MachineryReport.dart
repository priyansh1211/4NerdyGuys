import 'package:flutter/material.dart';
import 'package:flutter_app/pages/WorkDoneToday.dart';
import 'package:get/get.dart';
class MachineryReport extends StatefulWidget {
  const MachineryReport({Key? key}) : super(key: key);

  @override
  State<MachineryReport> createState() => _MachineryReportState();
}

class _MachineryReportState extends State<MachineryReport> {
  int number = 1;

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
            OutlinedButton(
                onPressed: () {
                  setState(() {
                    number = number + 1;
                  });
                },
                child: const Text("Add a column")),
            SizedBox(height: 20,),
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
                          width: MediaQuery.of(context).devicePixelRatio,
                        )),
                    const WidgetSpan(child: Icon(Icons.more_horiz)),
                    // TextSpan(text: 'to add'),
                  ],
                ),
              ),
            ),
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
                  style: TextStyle(color: Colors.black54),
                  decoration: InputDecoration(
                    hintText: '-Select Agency-',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(right:180),
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                          text: 'Description',
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
                height: 55,
                margin: const EdgeInsets.only(right: 100),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const TextField(
                  style: TextStyle(color: Colors.black54),
                  decoration: InputDecoration(
                    hintText: '-Give Work Description-',
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
                          padding: const EdgeInsets.only(right: 190),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                const TextSpan(
                                    text: 'Remarks',
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
                                  const WorkDoneToday()));
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
