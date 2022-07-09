import 'package:flutter/material.dart';
import 'package:flutter_app/pages/DpReport.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
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
              left: 20,
              top: 20,
              child: Icon(
                Icons.arrow_back_ios,
                size: 30,
              ),
            ),
            Positioned(
              left: 50,
              top: 20,
              child: Text(
                "Projects",
                style: TextStyle(fontSize: 30, fontFamily: 'OpenSans'),
              ),
            ),
            Align(
              alignment: Alignment(0.96,-0.95),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: Center(
                  child: Icon(
                    Icons.person,
                    size: 20,
                    color: Colors.blue[500],
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 50,
                          ),
                          height: 180,
                          width: 148,
                          child: InkWell(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              elevation: 10.0,
                            ),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> DpReportPage()));
                            },
                          ),
                        ),
                        Positioned(
                          top: 63,
                          left: 11,
                          child: Image.asset('assets/images/proj_2.png'),
                        ),
                        const Positioned(
                          top: 119,
                          left: 16,
                          child: Text(
                            "Sanskruti",
                            style: TextStyle(fontSize: 18, fontFamily: 'Inter'),
                          ),
                        ),
                        const Positioned(
                          top: 140,
                          left: 17,
                          child: Text(
                            "Ongoing Site",
                            style: TextStyle(
                                fontSize: 10,
                                fontFamily: 'Inter',
                                color: Color(0xff796A6A)),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 20,
                          ),
                          height: 180,
                          width: 148,
                          child: InkWell(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              elevation: 10.0,
                            ),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> DpReportPage()));
                            },
                          ),
                        ),
                        Positioned(
                          top: 33,
                          left: 11,
                          child: Image.asset('assets/images/proj_2.png'),
                        ),
                        const Positioned(
                          top: 89,
                          left: 16,
                          child: Text(
                            "Antiriksh",
                            style: TextStyle(fontSize: 18, fontFamily: 'Inter'),
                          ),
                        ),
                        const Positioned(
                          top: 110,
                          left: 17,
                          child: Text(
                            "Ongoing Site",
                            style: TextStyle(
                                fontSize: 10,
                                fontFamily: 'Inter',
                                color: Color(0xff796A6A)),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 20,
                          ),
                          height: 180,
                          width: 148,
                          child: InkWell(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              elevation: 10.0,
                            ),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> DpReportPage()));
                            },
                          ),
                        ),
                        Positioned(
                          top: 33,
                          left: 11,
                          child: Image.asset('assets/images/proj_2.png'),
                        ),
                        const Positioned(
                          top: 89,
                          left: 16,
                          child: Text(
                            "Nakshatra",
                            style: TextStyle(fontSize: 18, fontFamily: 'Inter'),
                          ),
                        ),
                        const Positioned(
                          top: 110,
                          left: 17,
                          child: Text(
                            "Ongoing Site",
                            style: TextStyle(
                                fontSize: 10,
                                fontFamily: 'Inter',
                                color: Color(0xff796A6A)),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 20,
                          ),
                          height: 180,
                          width: 148,
                          child: InkWell(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              elevation: 10.0,
                            ),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> DpReportPage()));
                            },
                          ),
                        ),
                        Positioned(
                          top: 33,
                          left: 11,
                          child: Image.asset('assets/images/proj_2.png'),
                        ),
                        const Positioned(
                          top: 89,
                          left: 16,
                          child: Text(
                            "Shrushti",
                            style: TextStyle(fontSize: 18, fontFamily: 'Inter'),
                          ),
                        ),
                        const Positioned(
                          top: 110,
                          left: 17,
                          child: Text(
                            "Ongoing Site",
                            style: TextStyle(
                                fontSize: 10,
                                fontFamily: 'Inter',
                                color: Color(0xff796A6A)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 20,
                          ),
                          height: 180,
                          width: 148,
                          child: InkWell(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              elevation: 10.0,
                            ),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> DpReportPage()));
                            },
                          ),
                        ),
                        Positioned(
                          top: 33,
                          left: 11,
                          child: Image.asset('assets/images/proj_2.png'),
                        ),
                        const Positioned(
                          top: 89,
                          left: 16,
                          child: Text(
                            "Bouganville",
                            style: TextStyle(fontSize: 18, fontFamily: 'Inter'),
                          ),
                        ),
                        const Positioned(
                          top: 110,
                          left: 17,
                          child: Text(
                            "Ongoing Site",
                            style: TextStyle(
                                fontSize: 10,
                                fontFamily: 'Inter',
                                color: Color(0xff796A6A)),
                          ),
                        ),
                      ],
                    ),Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 20,
                          ),
                          height: 180,
                          width: 148,
                          child: InkWell(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              elevation: 10.0,
                            ),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> DpReportPage()));
                            },
                          ),
                        ),
                        Positioned(
                          top: 33,
                          left: 11,
                          child: Image.asset('assets/images/proj_2.png'),
                        ),
                        const Positioned(
                          top: 89,
                          left: 16,
                          child: Text(
                            "Upcoming",
                            style: TextStyle(fontSize: 18, fontFamily: 'Inter'),
                          ),
                        ),
                        const Positioned(
                          top: 110,
                          left: 17,
                          child: Text(
                            "Ongoing Site",
                            style: TextStyle(
                                fontSize: 10,
                                fontFamily: 'Inter',
                                color: Color(0xff796A6A)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment(0,0.97),
                  child: Container(
                    width: 64,
                    height: 45,
                    margin: EdgeInsets.only(
                      top: 20,
                    ),
                    decoration: BoxDecoration(
                        color: Color(0xff91DEF2),
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: IconButton(
                      icon: Icon(Icons.add,color: Colors.white,),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
