// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_app/Server%20(Back%20End)/network_handler.dart';
import 'package:flutter_app/pages/fileforanalyticsone.dart';
import 'package:flutter_app/pages/forchartanalytics.dart';

class ItemDetailPage extends StatefulWidget {
  String code;
  String cont;
  String proj;
  ItemDetailPage(
      {Key? key, required this.proj, required this.cont, required this.code})
      : super(key: key);

  @override
  State<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  final List<SubscriberSeries> data = [
    SubscriberSeries(
        year: '1-7',
        subScribers: 400000,
        barColor: charts.ColorUtil.fromDartColor(const Color(0xffA6D1E6))),
    SubscriberSeries(
        year: '7/24',
        subScribers: 50000,
        barColor: charts.ColorUtil.fromDartColor(const Color(0xffA6D1E6))),
    SubscriberSeries(
        year: '7/25',
        subScribers: 312000,
        barColor: charts.ColorUtil.fromDartColor(const Color(0xffA6D1E6))),
    SubscriberSeries(
        year: '7/26',
        subScribers: 360000,
        barColor: charts.ColorUtil.fromDartColor(const Color(0xffA6D1E6))),
  ];

  Map<String, Color> a = {
    "Jan": const Color(0xffA6D1E6),
    "Feb": const Color(0xffE5E5E5),
    "Mar": const Color(0xffE5E5E5),
    "Apr": const Color(0xffE5E5E5),
    "May": const Color(0xffE5E5E5),
    "Jun": const Color(0xffE5E5E5),
    "Jul": const Color(0xffE5E5E5),
    "Aug": const Color(0xffE5E5E5),
    "Sep": const Color(0xffE5E5E5),
    "Oct": const Color(0xffE5E5E5),
    "Nov": const Color(0xffE5E5E5),
    "Dec": const Color(0xffE5E5E5),
  };

  void changeColor(String index, Color changeToColor) {
    setState(() {
      a.forEach((key, value) {
        a[key] = const Color(0xffE5E5E5);
      });
      a[index] = changeToColor;
    });
  }
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   data.add(SubscriberSeries(year: year, subScribers: subScribers, barColor: charts.ColorUtil.fromDartColor(const Color(0xffA6D1E6)));
  // }

  NetworkHandler p = NetworkHandler();

  TextEditingController used = TextEditingController();
  TextEditingController total = TextEditingController();

  final fkey = GlobalKey<FormState>();
  final fkey2 = GlobalKey<FormState>();

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
            //print(data[0].year.runtimeType);
            return Scaffold(
                body: ListView(
              children: [
                Stack(
                  children: [
                    Container(
                        color: const Color(0xffE5E5E5),
                        //height: MediaQuery.of(context).size.height*0.33,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          children: [
                            Positioned(
                                left: 20,
                                top: 10,
                                child: InkWell(
                                  child: const Icon(
                                    Icons.arrow_back_ios,
                                    size: 30,
                                  ),
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                )),
                            Positioned(
                              top: MediaQuery.of(context).size.height * 0.06375,
                              left: MediaQuery.of(context).size.width * 0.05555,
                              child: const Text('Items Details',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.13,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              left: 10, right: 5),
                                          padding: const EdgeInsets.all(20),
                                          decoration: const BoxDecoration(
                                            color: Color(0xff8FBFF8),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(19)),
                                          ),
                                          child: Form(
                                            key: fkey2,
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller: used,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration:
                                                      const InputDecoration(
                                                    filled: true,
                                                    fillColor:
                                                        Color(0xffA6D1E6),
                                                    border:
                                                        OutlineInputBorder(),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8)),
                                                      borderSide: BorderSide(
                                                          color: Color(
                                                              0xffA6D1E6)),
                                                    ),
                                                    label: Center(
                                                      child: Text(
                                                          "Enter used items"),
                                                    ),
                                                  ),
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return "Enter Used Items";
                                                    }
                                                    return null;
                                                  },
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),

                                                InkWell(
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.87,
                                                    height: 50,
                                                    decoration: const BoxDecoration(
                                                        color:
                                                            Color(0xffA6D1E6),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10))),
                                                    child: const Center(
                                                      child: Text('Submit',
                                                          style: TextStyle(
                                                              fontSize: 20)),
                                                    ),
                                                  ),
                                                  onTap: () async {
                                                    if (fkey2.currentState!
                                                        .validate()) {
                                                      int newTotal = snapshot
                                                                  .data![0][
                                                              "total_quantity"] -
                                                          int.parse(used.text);
                                                      int newUsed = snapshot
                                                                  .data![0]
                                                              ["used_items"] +
                                                          int.parse(used.text);
                                                      await p.updateItems({
                                                        "project_name": widget
                                                            .proj
                                                            .toString(),
                                                        "item_name": widget.cont
                                                            .toString(),
                                                        "item_code": widget.code
                                                            .toString(),
                                                        "used_items": newUsed,
                                                        "total_quantity":
                                                            newTotal
                                                      });
                                                      used.clear();
                                                    }
                                                  },
                                                ),

                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              left: 5, right: 10),
                                          padding: const EdgeInsets.all(20),
                                          decoration: const BoxDecoration(
                                            color: Color(0xff8FBFF8),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(19)),
                                          ),
                                          child: Form(
                                            key: fkey,
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller: total,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration:
                                                      const InputDecoration(
                                                    filled: true,
                                                    fillColor:
                                                        Color(0xffA6D1E6),
                                                    border:
                                                        OutlineInputBorder(),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8)),
                                                      borderSide: BorderSide(
                                                          color: Color(
                                                              0xffA6D1E6)),
                                                    ),
                                                    label: Center(
                                                      child:
                                                          Text("Add quantity"),
                                                    ),
                                                  ),
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return "Enter quantity";
                                                    }
                                                    return null;
                                                  },
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                InkWell(
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.87,
                                                    height: 50,
                                                    decoration: const BoxDecoration(
                                                        color:
                                                            Color(0xffA6D1E6),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10))),
                                                    child: const Center(
                                                      child: Text('Submit',
                                                          style: TextStyle(
                                                              fontSize: 20)),
                                                    ),
                                                  ),
                                                  onTap: () async {
                                                    if (fkey.currentState!
                                                        .validate()) {
                                                      int newTotal = snapshot
                                                                  .data![0][
                                                              "total_quantity"] +
                                                          int.parse(total.text);
                                                      await p
                                                          .updateQuantityItems({
                                                        "project_name": widget
                                                            .proj
                                                            .toString(),
                                                        "item_name": widget.cont
                                                            .toString(),
                                                        "item_code": widget.code
                                                            .toString(),
                                                        "total_quantity":
                                                            newTotal
                                                      });
                                                      total.clear();
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 30),
                                    height: 60,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: a.keys.length,
                                      itemBuilder:
                                          (BuildContext context, int index) =>
                                              InkWell(
                                        child: Card(
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          color: a.values.elementAt(index),
                                          elevation: 0,
                                          child: SizedBox(
                                              width: 50,
                                              child: Center(
                                                child: Text(a.keys
                                                    .elementAt(index)
                                                    .toString()),
                                              )),
                                        ),
                                        onTap: () {
                                          changeColor(
                                              a.keys
                                                  .elementAt(index)
                                                  .toString(),
                                              const Color(0xffA6D1E6));
                                        },
                                      ),
                                    ),
                                  ),
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.9111,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.23375,
                                      margin: const EdgeInsets.only(
                                           top: 10),
                                      child: SubscriberChart(
                                        data: data,
                                      )),
                                  Container(
                                    height: 250,
                                    width: MediaQuery.of(context).size.width,
                                    margin: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 20,
                                        bottom: 20),
                                    padding: const EdgeInsets.only(
                                        left: 15, top: 15),
                                    decoration: const BoxDecoration(
                                      color: Color(0xffA6D1E6),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                    child: Stack(
                                      children: [
                                        const Text(
                                          "Information of Item",
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontFamily: 'Inter',
                                              color: Colors.white),
                                        ),
                                        Positioned(
                                          top: 60,
                                          child: Text(
                                            widget.cont,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontFamily: 'Inter',
                                                color: Colors.white),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Positioned(
                                          top: 100,
                                          child: Text(
                                            widget.code,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontFamily: 'Inter',
                                                color: Colors.white),
                                          ),
                                        ),
                                        Positioned(
                                          top: 140,
                                          child: Text(
                                            snapshot.data![0]
                                                    ["item_description"]
                                                .toString(),
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontFamily: 'Inter',
                                                color: Colors.white),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 30, right: 20),
                                          child: Align(
                                            alignment: Alignment.bottomRight,
                                            child: Container(
                                              height: 66,
                                              decoration: const BoxDecoration(
                                                color: Colors.blueAccent,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                              ),
                                              padding: const EdgeInsets.all(10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Used : ${snapshot.data![0]["used_items"].toString()}",
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontFamily: 'Inter',
                                                        color: Colors.white),
                                                  ),
                                                  Text(
                                                    "Total : ${snapshot.data![0]["total_quantity"].toString()}",
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontFamily: 'Inter',
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ],
                )
              ],
            ));
          }

          return const Text("Something Went Wrong");
        },
        stream: p.listitemdetails({
          "project_name": widget.proj.toString(),
          "item_name": widget.cont.toString(),
          "item_code": widget.code.toString()
        }));
  }
}
