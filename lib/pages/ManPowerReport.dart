import 'package:flutter/material.dart';
class ManPowerReport extends StatefulWidget {
  const ManPowerReport({Key? key}) : super(key: key);

  @override
  State<ManPowerReport> createState() => _ManPowerReportState();
}

class _ManPowerReportState extends State<ManPowerReport> {
  @override
  Widget build(BuildContext context) {
    Row toolbar = new Row(
      children:<Widget>[
        new Icon(Icons.arrow_back_ios),
        new Expanded(child: Text('Man Power Report')),
        new CircleAvatar(radius: 20,backgroundColor: Colors.white,child: Icon(Icons.person,size: 20,color: Colors.blue[500],),)
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: toolbar,
      ),
      body: Row(
        children: <Widget>[

        ],
      ),
    );
  }
}
