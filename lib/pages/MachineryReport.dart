import 'package:flutter/material.dart';
class MachineryReport extends StatefulWidget {
  const MachineryReport({Key? key}) : super(key: key);

  @override
  State<MachineryReport> createState() => _MachineryReportState();
}

class _MachineryReportState extends State<MachineryReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffE5E5E5),
        title: const Text(
          "Machinery Report:",
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
        actions: <Widget>[
          Padding(
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
                )),
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.only(left: 12),
              height: 50,
              margin: EdgeInsets.only(right: 160),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child:  TextField(
                decoration: InputDecoration(
                  hintText: 'Add Data',
                  suffixIcon: Icon(Icons.keyboard_arrow_down_rounded),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: Text(
              'Agency',
              style: TextStyle(color: Colors.black,fontSize: 17),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.only(left: 12),
              height: 50,
              margin: EdgeInsets.only(right: 100),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                style: TextStyle(color: Colors.black54),
                decoration: InputDecoration(
                  hintText: '-Select Agency-',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 24),
            child: Text(
              'Description',
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.only(left: 12),
              height: 55,
              margin: EdgeInsets.only(right: 100),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                style: TextStyle(color: Colors.black54),
                decoration: InputDecoration(
                  hintText: '-Give Work Description-',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          //SizedBox(height: 10,),
          Padding(
            padding: EdgeInsets.only(left: 24),
            child: Text(
              'Remarks',
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.only(left: 12),
              height: 50,
              margin: EdgeInsets.only(right: 100),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              height: 50,
              margin: EdgeInsets.only(right: 170),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(decoration: InputDecoration(
                prefixIcon: Icon(Icons.add_a_photo),
                hintText: 'Add Image',
                border: InputBorder.none,
              ),
              ),
            ),
          ),SizedBox(height: 40,),
          MaterialButton(
            onPressed: () {},
            child: Container(
              height: 50,
              width: 130,
              margin: EdgeInsets.symmetric(horizontal: 105),
              decoration: BoxDecoration(
                color: Colors.blue.shade600,
                borderRadius: BorderRadius.circular(35.0),
              ),
              child: Center(
                child: Text(
                  "Make Report",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      fontSize: 15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
