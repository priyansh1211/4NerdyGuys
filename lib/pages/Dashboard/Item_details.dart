import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/Dashboard/fileforanalyticsone.dart';
import 'package:flutter_app/pages/Dashboard/forchartanalytics.dart';

class ItemDetailPage extends StatefulWidget {
  final String cont;

  const ItemDetailPage({Key? key, required this.cont}) : super(key: key);

  @override
  State<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  final List<SubscriberSeries> data = [
    SubscriberSeries(
        year: '7/23',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Stack(
          children: [
            SizedBox(
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
                              fontSize: 30, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.13,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xffA6D1E6),
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  labelText: 'Enter available items'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter Something";
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 5),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xffA6D1E6),
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  labelText: 'Enter total items'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter Something";
                                }
                                return null;
                              },
                            ),
                          ),
                          InkWell(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.87,
                              height: 50,
                              decoration: const BoxDecoration(
                                  color: Color(0xffA6D1E6),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: const Center(
                                child: Text('Submit',
                                    style: TextStyle(fontSize: 20)),
                              ),
                            ),
                            onTap: () {},
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.9111,
                              height:
                                  MediaQuery.of(context).size.height * 0.23375,
                              margin: const EdgeInsets.only(left: 15, top: 50),
                              child: SubscriberChart(
                                data: data,
                              )),
                          Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            color: const Color(0xffA6D1E6),
                            child: Column(
                              children: [
                                const Text(
                                  "Information of Item",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontFamily: 'Inter',
                                      color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  widget.cont,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Inter',
                                      color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  "CC043",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Inter',
                                      color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  "Flooring",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Inter',
                                      color: Colors.white),
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
}
