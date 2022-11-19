import 'package:flutter/material.dart';
// again
class OwnerPage extends StatefulWidget{
  const OwnerPage ({Key? key}) : super(key:key);
  @override
  State<OwnerPage> createState() => _OwnerPageState();
}

class _OwnerPageState extends State<OwnerPage>{

  List Listfordate = [
    '18 DEC 2019',
    'date 2',
    'date 3',
    'date 4',
    'date 5',
  ];
  List Listforname = [
    'name 1',
    'name 2',
    'name 3',
    'name 4',
    'name 5',
  ];
  List Listforsite = [
    'site 1',
    'site 2',
    'site 3',
    'site 4',
    'site 5',
  ];
  List ListforBlock = [
    'block B',
    'block A',
    'block C',
    'block D',
    'block E',
  ];

  @override
  Widget build(BuildContext context){
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: const Color(0xffE5E5E5),
        child: Stack (children: [
          Container(
            decoration: const BoxDecoration(color: Color(0xffE5E5E5)),
          ),
          Positioned(
            left: screensize.width * 0.05,
            top: screensize.height * 0.05,
            child: InkWell(
              child: const Icon(
                Icons.arrow_back_ios,
                size: 30,
              ),
              onTap: () {Navigator.of(context).pop();},
            ),),
          Positioned(
            right: screensize.width * 0.05,
            top: screensize.height * 0.05,
            child: InkWell(
              child: const Icon(
                Icons.calendar_today,
                size: 30,
              ),
              onTap: () {print("Calender pressed");},
            ),),
          ListView.builder(
            itemCount: Listfordate.length,
            itemBuilder: (BuildContext context, int index){
              return Card(
                margin: EdgeInsets.only(
                  top: screensize.width * 0.03,
                  left: screensize.width * 0.04,
                  right: screensize.width * 0.04,
                ),
                color:  Color(0xff68B1D5),
                child: ListTile(
                  title: Text(Listfordate[index],
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontFamily: 'Readxpro')),
                  subtitle: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: screensize.height * 0.02),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(Listforname[index],
                            style: TextStyle(fontSize: 18),),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: screensize.height * 0.02,),
                              child: Align(alignment:Alignment.bottomLeft,
                                  child: Text(Listforsite[index],style:TextStyle(fontSize: 18))),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: screensize.height * 0.02,left: screensize.width*0.2),
                              child: Text(ListforBlock[index],style: TextStyle(fontSize: 18),/*textAlign: TextAlign.center,*/),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ButtonTheme(
                          child: ButtonBar(
                            children: <Widget>[
                              ElevatedButton(
                                child: Text("View Report"),
                                onPressed: () {print("Go to view page");},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ]),
      ),
    );
  }
}