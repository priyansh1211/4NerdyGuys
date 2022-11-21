import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_app/pages/fileforanalyticsone.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/pages/forchartanalytics.dart';
import 'package:flutter_app/pages/analytics.dart';

class analyticsTwoPage extends StatefulWidget {
  const analyticsTwoPage({Key? key}) : super(key: key);
  @override
  State<analyticsTwoPage> createState() => _analyticsTwoPageState();
}

class _analyticsTwoPageState extends State<analyticsTwoPage>{
  /*final List<SubscriberSeries> data = [
    SubscriberSeries(year: '7/23', subScribers: 400000, barColor: charts.ColorUtil.fromDartColor(Color(0xffA6D1E6))),
    SubscriberSeries(year: '7/24', subScribers: 50000, barColor: charts.ColorUtil.fromDartColor(Color(0xffA6D1E6))),
    SubscriberSeries(year: '7/25', subScribers: 312000, barColor: charts.ColorUtil.fromDartColor(Color(0xffA6D1E6))),
    SubscriberSeries(year: '7/26', subScribers: 360000, barColor: charts.ColorUtil.fromDartColor(Color(0xffA6D1E6))),
  ];*/
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
              child: Text(
                'Analytics',
                style: TextStyle(fontFamily: 'Readxpro',fontSize: 25),
              ),
            ),
            Positioned(
              right: screensize.width * 0.05,
              top: screensize.height * 0.118,
              child: InkWell(
                child: Row(
                  children: [
                    Container(
                      child: Icon(Icons.calendar_today,size:30),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: screensize.width,
              margin: EdgeInsets.only(top: screensize.height * 0.2,),
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      Container(
                        width: screensize.width * 0.91,
                        height: screensize.height * 0.18625,
                        decoration: BoxDecoration(
                            color: const Color(0xffA6D1E6)
                        ),
                        margin: EdgeInsets.only(left: screensize.width * 0.045),
                        child: InkWell(
                          child: Container(
                            margin: EdgeInsets.only(top: screensize.height * 0.004,left: screensize.width * 0.05),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Febuary',
                              style: TextStyle(fontSize: 20,fontFamily: 'Opensas'),
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
                        decoration: BoxDecoration(
                            color: const Color(0xffA6D1E6)
                        ),
                        margin: EdgeInsets.only(left: screensize.width * 0.045,top: screensize.height * 0.03),
                        child: InkWell(
                          child: Stack(
                            children: [
                              Positioned(
                                  left: screensize.width * 0.05,
                                  top: screensize.height * 0.08,
                                  child: Text('March',style: TextStyle(fontFamily: 'Opensas',fontSize: 20),)
                              ),
                              Positioned(
                                right: screensize.width * 0.1,
                                top: screensize.height * 0.07,
                                child: Icon(Icons.arrow_forward,size: 40,),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => const analyticsPage()));
                            print("go to other month");},
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Image.asset(
                          'assets/images/febuary.jpeg',
                          width: 55,
                          height: 50,
                        ),
                        margin: EdgeInsets.only(
                            left: 20,top:10),
                        /*child: SubscriberChart(
                          data: data,
                        )*/
                      ),
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