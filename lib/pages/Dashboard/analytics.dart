import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/Dashboard/analyticstwo.dart';
import 'package:flutter_app/pages/Dashboard/fileforanalyticsone.dart';
import 'package:flutter_app/pages/Dashboard/forchartanalytics.dart';

class analyticsPage extends StatefulWidget {
  const analyticsPage({Key? key}) : super(key: key);

  @override
  State<analyticsPage> createState() => _analyticsPageState();
}

class _analyticsPageState extends State<analyticsPage> {
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
  List ListforMonth = [
    'January',
    'February',
  ];

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xffE5E5E5),
              ),
            ),
            Positioned(
              left: 30,
              top: 46,
              child: InkWell(
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Positioned(
              left: 30,
              top: screensize.height * 0.118,
              child: const Text(
                'Analytics',
                style: TextStyle(fontFamily: 'Readxpro', fontSize: 25),
              ),
            ),
            Positioned(
              right: screensize.width * 0.05,
              top: screensize.height * 0.118,
              child: InkWell(
                child: Row(
                  children: [
                    Container(
                      child: const Icon(Icons.calendar_today, size: 30),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: screensize.width,
              margin: EdgeInsets.only(
                top: screensize.height * 0.2,
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      Container(
                        width: screensize.width * 0.91,
                        height: screensize.height * 0.18625,
                        decoration:
                            const BoxDecoration(color: Color(0xffA6D1E6)),
                        margin: EdgeInsets.only(left: screensize.width * 0.045),
                        child: InkWell(
                          child: Container(
                            margin: EdgeInsets.only(
                                top: screensize.height * 0.004,
                                left: screensize.width * 0.05),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'January',
                              style: TextStyle(
                                  fontSize: 20, fontFamily: 'Opensans'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: screensize.width * 0.91,
                        height: screensize.height * 0.18625,
                        decoration:
                            const BoxDecoration(color: Color(0xffA6D1E6)),
                        margin: EdgeInsets.only(
                            left: screensize.width * 0.045,
                            top: screensize.height * 0.03),
                        child: InkWell(
                          child: Stack(
                            children: [
                              Positioned(
                                  left: screensize.width * 0.05,
                                  top: screensize.height * 0.08,
                                  child: const Text(
                                    'Febuary',
                                    style: TextStyle(
                                        fontFamily: 'Opensas', fontSize: 20),
                                  )),
                              Positioned(
                                right: screensize.width * 0.1,
                                top: screensize.height * 0.07,
                                child: const Icon(
                                  Icons.arrow_forward,
                                  size: 40,
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const analyticsTwoPage()));
                            print("go to analytics Two");
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          width: screensize.width * 0.9111,
                          height: screensize.height * 0.23375,
                          margin: const EdgeInsets.only(left: 15, top: 50),
                          child: SubscriberChart(
                            data: data,
                          )),
                    ],
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
