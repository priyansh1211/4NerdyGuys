import 'package:flutter/material.dart';
class ActiveEmployees extends StatefulWidget {
  const ActiveEmployees({Key? key}) : super(key: key);

  @override
  State<ActiveEmployees> createState() => _ActiveEmployeesState();
}

class _ActiveEmployeesState extends State<ActiveEmployees> {
  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffE7EAEB),
      appBar: AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0xffE7EAEB),
        title: const Text(
          "Active Employees",
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
      ),
     body: Column(
       children: [
         Padding(
           padding: const EdgeInsets.all(20),
           child: Container(
             padding: EdgeInsets.only(left: 10,top: 5,bottom: 5),
             height: screensize.height*0.04375,
             width: screensize.width*0.625,
             margin: const EdgeInsets.only(right: 120),
             decoration: BoxDecoration(
               color: Colors.blue.shade100,
               borderRadius: BorderRadius.circular(15),
             ),
             child:  const TextField(
               decoration: InputDecoration(
                 hintText: 'Junior Engineer',
                 suffixIcon: Icon(Icons.keyboard_arrow_down_rounded),
                 border: InputBorder.none,
               ),
             ),
           ),
         ),
         Container(
           height: 125,
           width: 275,
           margin: const EdgeInsets.only(
               bottom: 6.0), //Same as `blurRadius` i guess
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(20.0),
             color: const Color(0xffBDE6F1),
             boxShadow: const [
               BoxShadow(
                 color: Colors.grey,
                 offset: Offset(0.0, 1.0), //(x,y)
                 blurRadius: 6.0,
               ),
             ],
           ),
           child: Stack(
             children: [
               Positioned(
                 height: 32,
                 width: 101,
                 right: 30,
                 bottom: 60,
               //  top: 32,
                 child: Text(
                   "Vishwas Bhatt",
                   style: TextStyle(
                     fontSize: 15,
                     fontFamily: 'ReadexPro',
                     fontWeight: FontWeight.w600,
                     //color: Color(0xffBDE6F1),
                   ),
                 ),
               ),
               Positioned(
                 top: 10,
                 height: 25,
                 width: 25,
                 left: 10,
                 child: Icon(Icons.arrow_right),
               ),
             ],
           ),
         ),
       ],
     ),
    );
  }
}
