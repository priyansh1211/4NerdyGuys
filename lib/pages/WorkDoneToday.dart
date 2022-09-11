import 'package:flutter/material.dart';
import 'package:flutter_app/pages/MaterialReport.dart';
import 'package:get/get.dart';
class WorkDoneToday extends StatefulWidget {
  const WorkDoneToday({Key? key}) : super(key: key);

  @override
  State<WorkDoneToday> createState() => _WorkDoneTodayState();
}

class _WorkDoneTodayState extends State<WorkDoneToday> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffE5E5E5),
        title: const Text(
          "Work Done Today:",
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
              padding: EdgeInsets.only(left: 20),
              height: 50,
              margin: EdgeInsets.only(right: 160),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child:  TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.keyboard_arrow_down_rounded),
                  hintText: 'Add Data',
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'Agency',style: TextStyle(color: Colors.black, fontSize: 20)),
                    WidgetSpan(child: SizedBox(width: MediaQuery.of(context).devicePixelRatio,)),
                    WidgetSpan(child: Icon(Icons.more_horiz)),
                    // TextSpan(text: 'to add'),
                  ],
                ),
              )
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.only(left: 20),
              height: 50,
              margin: EdgeInsets.only(right: 100),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child:TextField(
                decoration: InputDecoration(
                  hintText: '-Select Agency-',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'Description(Location)',style: TextStyle(color: Colors.black, fontSize: 20)),
                    WidgetSpan(child: SizedBox(width: MediaQuery.of(context).devicePixelRatio,)),
                    WidgetSpan(child: Icon(Icons.more_horiz)),
                    // TextSpan(text: 'to add'),
                  ],
                ),
              )
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.only(left: 20),
              height: 50,
              margin: EdgeInsets.only(right: 100),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '-Give Work Description-',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          //SizedBox(height: 10,),
          //SizedBox(height: 10,),
          Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'Remarks',style: TextStyle(color: Colors.black, fontSize: 20)),
                    WidgetSpan(child: SizedBox(width: MediaQuery.of(context).devicePixelRatio,)),
                    WidgetSpan(child: Icon(Icons.more_horiz)),
                    // TextSpan(text: 'to add'),
                  ],
                ),
              )
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.only(left: 20),
              height: 50,
              margin: EdgeInsets.only(right: 100),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                decoration: InputDecoration(
                //  hintText: '-Give Work Description-',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          SizedBox(height: 40,),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  Get.defaultDialog(
                    middleText: "Do you want to continue?",
                    titleStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'ReadexPro',
                        fontSize: 15),
                    middleTextStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'ReadexPro',
                        fontSize: 15),
                    textCancel: "NO",
                    cancelTextColor: const Color(0xff685D5D),
                    textConfirm: "YES",
                    confirmTextColor: Colors.lightGreenAccent,
                    radius: 40,
                    buttonColor: const Color(0xff685D5D),
                    //barrierDismissible: false,
                    backgroundColor: const Color(0xff009AFF),
                    onConfirm: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const MaterialReport()));
                    },
                  );
                }, child: const Text(
                  "Make Report",
                  // style: TextStyle(
                  //     color: Colors.white,
                  //     fontWeight: FontWeight.bold,
                  //     fontFamily: 'ReadexPro',
                  //     fontSize: 15),
                ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
