import 'package:flutter/material.dart';
class TargetVsAchieved extends StatefulWidget {
  const TargetVsAchieved({Key? key}) : super(key: key);

  @override
  State<TargetVsAchieved> createState() => _TargetVsAchievedState();
}

class _TargetVsAchievedState extends State<TargetVsAchieved> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey.shade400,
        title: const Text(
          "Target Vs Achieved:",
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
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.only(left: 20),
              height: 50,
              margin: const EdgeInsets.only(right: 160),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child:  const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.keyboard_arrow_down_rounded),
                  hintText: 'Add Data',
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: EdgeInsets.only(left: 20),
              height: 50,
              margin: const EdgeInsets.only(bottom: 16,left: 160),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child:  const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.keyboard_arrow_down_rounded),
                  hintText: 'Select Block',
                ),
              ),
            ),
          ),
          const SizedBox(height: 10,),
          const Padding(
            padding: EdgeInsets.only(left: 25),
            child: Text(
              'Description(Location)',
              style: TextStyle(color: Colors.black,fontSize: 17),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.only(left: 20),
              height: 50,
              margin: const EdgeInsets.only(right: 100),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child:const TextField(
                decoration: InputDecoration(
                  hintText: '-Give Work Description-',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 24),
            child: Text(
              'Status',
              style: TextStyle(color: Colors.black,fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.only(left: 20),
              height: 50,
              margin: const EdgeInsets.only(right: 100),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child:  const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  //prefixIcon: Icon(Icons)
                ),
              ),
            ),
          ),
          //SizedBox(height: 10,),
          const Padding(
            padding: EdgeInsets.only(left: 24),
            child: Text(
              'Concrete Used',
              style: TextStyle(color: Colors.black,fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.only(left: 20),
              height: 55,
              margin: const EdgeInsets.only(right: 100),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
             child:  const TextField(
               decoration: InputDecoration(
                 border: InputBorder.none,
               ),
             ),
            ),
          ),
          //SizedBox(height: 10,),
          const Padding(
            padding: EdgeInsets.only(left: 24),
            child: Text(
              'Reason if not achieved',
              style: TextStyle(color: Colors.black,fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.only(left: 20),
              height: 55,
              margin: const EdgeInsets.only(right: 100),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child:  const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          //SizedBox(height: 10,),
          const Padding(
            padding: EdgeInsets.only(left: 24),
            child: Text(
              'Remarks',
              style: TextStyle(color: Colors.black,fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              //padding: EdgeInsets.only(left: 20),
              height: 50,
              margin: const EdgeInsets.only(right: 100),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.mode_comment_outlined),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              height: 50,
              margin: const EdgeInsets.only(right: 160),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const TextField(decoration: InputDecoration(
                prefixIcon: Icon(Icons.insert_photo_outlined),
                hintText: 'Add Target Image',
                border: InputBorder.none,
              ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              height: 50,
              margin: const EdgeInsets.only(right: 150),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const TextField(decoration: InputDecoration(
                prefixIcon: Icon(Icons.add_a_photo),
                hintText: 'Add Achieved Image',
                border: InputBorder.none,
              ),
              ),
            ),
          ),
          SizedBox(height: 20,),
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