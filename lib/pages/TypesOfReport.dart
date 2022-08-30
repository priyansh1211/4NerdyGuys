import 'package:flutter/material.dart';
import 'package:flutter_app/pages/DpReport.dart';
class TypesOfReport extends StatefulWidget {
  const TypesOfReport({Key? key}) : super(key: key);

  @override
  State<TypesOfReport> createState() => _TypesOfReportState();
}

class _TypesOfReportState extends State<TypesOfReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      body: Column(
        children: [
          const SizedBox(
            height: 55,
          ),
              Padding(
                padding: const EdgeInsets.only(left:20,right:10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Hello,Vishwas",
                  hintStyle: const TextStyle(
                    fontFamily: "ReadexPro",
                    fontSize: 30,
                    color: Colors.black,
                  ),
                  border: InputBorder.none,
                  suffixIcon: Padding(
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
                ),
              ),
              ),
          SizedBox(
            height: 30,
          ),
          Padding(padding: EdgeInsets.only(left: 20),
            child:TextField(
              decoration: InputDecoration(
                hintText: "Choose Report",
                border: InputBorder.none,
                hintStyle: TextStyle(
                  fontFamily: "ReadexPro",
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            children: [
              Stack(
                children: [
                  InkWell(
                    child: Card(
                      color: Color(0xffBDE6F1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      child: const SizedBox(
                        height: 125,
                        width: 275,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> DpReportPage() ));
                    },
                  ),
                  Positioned(
                    height: 40,
                    width: 110,
                    right: 30,
                    bottom: 60,
                    child: Text(
                      "Daily Progress Report",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'ReadexPro',
                          fontWeight: FontWeight.w600,
                      //color: Color(0xffBDE6F1),
                    ),
                  ),
                  ),
                  Positioned(
                    top: 10,
                    height: 101,
                    width: 108,
                    left: 10,
                    child: Image.asset('assets/images/report1.png'),
                  ),
                    FloatingActionButton(
                      shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(Icons.add),
                        onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DpReportPage()));
                 },
                     // elevation: 10,
                      backgroundColor: Colors.black,
                 ),
                 // FloatingActionButtonLocation.endFloat
                 ],
              ),
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  InkWell(
                    child: Card(
                      color: Color(0xffBDE6F1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      child: const SizedBox(
                        height: 125,
                        width: 275,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> DpReportPage() ));
                    },
                  ),
                  Positioned(
                    height: 40,
                    width: 110,
                    right: 30,
                    bottom: 60,
                    child: Text(
                      "Site Progress Report",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'ReadexPro',
                        fontWeight: FontWeight.w600,
                        //color: Color(0xffBDE6F1),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    height: 101,
                    width: 108,
                    left: 10,
                    child: Image.asset('assets/images/report2.png'),
                  ),
                ],
              ),
            ],
          ),
            ],
      ),
    );
  }
}
