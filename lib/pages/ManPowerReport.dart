import 'package:flutter/material.dart';
class ManPowerReport extends StatefulWidget {
  const ManPowerReport({Key? key}) : super(key: key);

  @override
  State<ManPowerReport> createState() => _ManPowerReportState();
}

class _ManPowerReportState extends State<ManPowerReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          children: <Widget>[
            Align(alignment: Alignment.topRight,
            child: CircleAvatar(radius: 20,backgroundColor: Colors.white,child:Center(child: Icon(Icons.person,size: 20,color: Colors.blue.shade500),) ),)
          ],
        ),
      ),
    );
  }
}
