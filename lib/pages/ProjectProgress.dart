import 'package:flutter/material.dart';
import 'package:flutter_app/pages/Project.dart';
import 'package:flutter_app/pages/TypesOfReport.dart';
import 'package:get/get.dart';
import 'package:flutter_app/pages/drawerpage.dart';

//import 'package:intl/intl.dart';
class ProjectProgress extends StatefulWidget {
  const ProjectProgress({Key? key}) : super(key: key);

  @override
  State<ProjectProgress> createState() => _ProjectProgressState();
}

class _ProjectProgressState extends State<ProjectProgress> {
  final List<TextEditingController> _controllers = [];
  final List<TextField> _fields = [];
  final _dateC = TextEditingController();

  // final _timeC = TextEditingController();

  ///Date
  DateTime selected = DateTime.now();
  DateTime initial = DateTime(2000);
  DateTime last = DateTime(2025);

  ///Time
  TimeOfDay timeOfDay = TimeOfDay.now();

  Future displayDatePicker(BuildContext context) async {
    var date = await showDatePicker(
      context: context,
      initialDate: selected,
      firstDate: initial,
      lastDate: last,
    );

    if (date != null) {
      setState(() {
        _dateC.text = date.toLocal().toString().split(" ")[0];
      });
    }
  }

  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  static List<String> friendsList = [];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: DrawerPage(),
      key: scaffoldKey,
      backgroundColor: const Color(0xffE5E5E5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xffE5E5E5),
        title: const Text(
          "Project Progress Review:",
          style: TextStyle(color: Colors.black, fontSize: 18),
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
          Positioned(
            left: 20,
            /*child: GestureDetector(
                //onTap: () => Scaffold.of(context).openEndDrawer(),
              //onTap: () {scaffoldKey.currentState.openEndDrawer();},
                child: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 30,
                    color: Colors.blue,
                  ),
                )),*/
            child: Builder(
              builder: (context) => ElevatedButton(
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                  backgroundColor: Colors.white,
                ),
                  child:Icon(Icons.person,size:30,color:Colors.blue),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Expanded(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Container(
                      padding: const EdgeInsets.only(left: 10),
                      height: 30,
                      margin: const EdgeInsets.only(right: 120),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                                text: 'Select Block',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20)),
                            WidgetSpan(
                                child: SizedBox(
                                  width: MediaQuery
                                      .of(context)
                                      .devicePixelRatio,
                                )),
                            // WidgetSpan(child: Icon(Icons.arrow_drop_up)),
                            const WidgetSpan(child: Icon(
                                Icons.arrow_drop_down)),
                          ],
                        ),
                      )),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left:12),
                //   child: Container(
                //       padding: const EdgeInsets.only(left: 10),
                //      // width: EdgeInsets.only(right: 10.0)
                //       height: 30,
                //       margin: const EdgeInsets.only(right: 5),
                //       decoration: BoxDecoration(
                //         color: Colors.blue.shade100,
                //         borderRadius: BorderRadius.circular(20),
                //       ),
                //       child: Text.rich(
                //         TextSpan(
                //           children: [
                //             TextSpan(text: 'Select Block',style: TextStyle(color: Colors.black, fontSize: 20)),
                //             WidgetSpan(child: SizedBox(width: MediaQuery.of(context).devicePixelRatio,)),
                //             // WidgetSpan(child: Icon(Icons.arrow_drop_up)),
                //             WidgetSpan(child: Icon(Icons.arrow_drop_down)),
                //           ],
                //         ),
                //       )
                //   ),
                // ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                      text: 'Choose Date',
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                  WidgetSpan(
                      child: SizedBox(
                        width: MediaQuery
                            .of(context)
                            .devicePixelRatio,
                      )),
                  // const WidgetSpan(child: Icon(Icons.date_range)),
                  // TextSpan(text: 'to add'),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.only(left: 12),
              height: 55,
              margin: const EdgeInsets.only(right: 100),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                style: const TextStyle(color: Colors.black54),
                decoration: const InputDecoration(
                  hintText: 'Choose Date',
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.calendar_month_rounded),
                ),
                controller: _dateC,
                onTap: () {
                  displayDatePicker(context);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                      text: 'Floor',
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                  WidgetSpan(
                      child: SizedBox(
                        width: MediaQuery
                            .of(context)
                            .devicePixelRatio,
                      )),
                  // const WidgetSpan(child: Icon(Icons.date_range)),
                  // TextSpan(text: 'to add'),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.only(left: 12),
              height: 55,
              margin: const EdgeInsets.only(right: 60),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const TextField(
                style: TextStyle(color: Colors.black54),
                decoration: InputDecoration(
                    hintText: 'Enter Foundation',
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.add)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    //text: 'Choose Date',
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                  WidgetSpan(
                      child: SizedBox(
                        width: MediaQuery
                            .of(context)
                            .devicePixelRatio,
                      )),
                  // const WidgetSpan(child: Icon(Icons.date_range)),
                  // TextSpan(text: 'to add'),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.only(left: 12),
              height: 55,
              margin: const EdgeInsets.only(right: 180),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                style: const TextStyle(color: Colors.black54),
                decoration: const InputDecoration(
                  hintText: 'Date',
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.calendar_month_rounded),
                ),
                controller: _dateC,
                onTap: () {
                  displayDatePicker(context);
                },
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 75),
            child: Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                      text: 'Planned Vs Achieved',
                      style: TextStyle(color: Colors.black, fontSize: 23)),
                  WidgetSpan(
                      child: SizedBox(
                        width: MediaQuery
                            .of(context)
                            .devicePixelRatio,
                      )),
                  // const WidgetSpan(child: Icon(Icons.date_range)),
                  // TextSpan(text: 'to add'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                      text: 'Milestones',
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                  WidgetSpan(
                      child: SizedBox(
                        width: MediaQuery
                            .of(context)
                            .devicePixelRatio,
                      )),
                  // const WidgetSpan(child: Icon(Icons.date_range)),
                  // TextSpan(text: 'to add'),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.only(left: 12),
              height: 55,
              margin: const EdgeInsets.only(right: 60),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const TextField(
                style: TextStyle(color: Colors.black54),
                decoration: InputDecoration(
                    hintText: 'Enter milestone',
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.add)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.only(left: 12),
              height: 55,
              margin: const EdgeInsets.only(right: 180),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                style: const TextStyle(color: Colors.black54),
                decoration: const InputDecoration(
                  hintText: 'Date',
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.calendar_month_rounded),
                ),
                controller: _dateC,
                onTap: () {
                  displayDatePicker(context);
                },
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {
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
                    onConfirm: () {
                      Navigator
                          .push(context, MaterialPageRoute(builder: (context)
                      =>
                      const ProjectPage()
                      ),
                      );
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