import 'package:flutter/material.dart';
import 'package:flutter_app/pages/drawerpage.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);
  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  List Listfordate = [
    '1-8',
  ];
  List Listfortask = [
    'After finishing work',
  ];
  final fkey = GlobalKey<FormState>();
  TextEditingController for_date = TextEditingController();
  TextEditingController for_task = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: DrawerPage(),
      body: Center(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xffE5E5E5),
              ),
            ),
            Positioned(
              left: 30,
              top: 46,
              child: InkWell(
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Positioned(
              left: 330,
              top: 46,
              child: Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.menu),
                  iconSize: 30,
                  color: Color(0xff000000),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                  tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                ),
              ),
            ),
            Positioned(
              left: 30,
              top: screensize.height * 0.118,
              child: Text(
                'Tasks',
                style: TextStyle(fontFamily: 'Readxpro', fontSize: 25),
              ),
            ),
            Positioned(
              left: screensize.width * 0.59,
              top: screensize.height * 0.118,
              child: InkWell(
                child: Row(
                  children: [
                    Container(
                      child: Icon(Icons.calendar_today, size: 25),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: screensize.width * 0.02),
                      child: Text(
                        'Add Task',
                        style: TextStyle(fontFamily: 'Readxpro', fontSize: 25),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  showDialog(
                      barrierDismissible: true,
                      context: context,
                      builder: (_){
                        return AlertDialog(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                          content: Form(
                            key: fkey,
                            child: SizedBox(
                              width: 100,
                              height: 230,
                              child: Column(
                                children: [
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Enter date ',
                                    ),
                                    controller: for_date,
                                    validator: (value){
                                      if (value == null || value.isEmpty) {
                                        return "Enter Date";
                                      }
                                      return null;
                                    },
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "Enter Task Detail",
                                    ),
                                    controller: for_task,
                                    validator: (value){
                                      if(value == null || value.isEmpty){
                                        return "Enter about Task";
                                      }
                                      return null;
                                    },
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            if(fkey.currentState!.validate()){
                                              Listfordate.add({
                                                for_date.text
                                              });
                                              Listfortask.add({
                                                for_task.text
                                              });
                                              Navigator.pop(context);
                                              for_date.clear();
                                              for_task.clear();
                                              setState(() {});
                                            }
                                          },
                                          child: const Text('Add'),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20,),
                                        child: ElevatedButton (
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Cancel'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                  );
                },
              ),
            ),
            Container(
              width: screensize.width * 0.91,
              height: screensize.height * 0.15625,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                color: const Color(0xffBDE6F1),
              ),
              margin: EdgeInsets.only(
                top: screensize.height * 0.185,
                left: screensize.width * 0.04,
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: screensize.height * 0.03,
                      right: screensize.width * 0.65,
                    ),
                    child: Text(
                      '1-8 Aug',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Container(
                    /*margin: EdgeInsets.only(
                      top: screensize.height * 0.0001,
                    ),*/
                    child: Text(
                      'After finishing \nShow reports to sir',
                      style: TextStyle(fontSize: 20, fontFamily: 'Readxpro'),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: screensize.width * 0.91,
              height: screensize.height * 0.15625,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                color: const Color(0xffBDE6F1),
              ),
              margin: EdgeInsets.only(
                top: screensize.height * 0.36125,
                left: screensize.width * 0.04,
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: screensize.height * 0.03,
                      right: screensize.width * 0.65,
                    ),
                    child: Text(
                      '9-16 Aug',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        //top: screensize.height * (0.01 / 6),
                        left: screensize.width * 0.105),
                    child: Text(
                      'Check Progress in block',
                      style: TextStyle(fontSize: 20, fontFamily: 'Readxpro'),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: screensize.width * 0.91,
              height: screensize.height * 0.15625,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                color: const Color(0xffBDE6F1),
              ),
              margin: EdgeInsets.only(
                top: screensize.height * 0.54125,
                left: screensize.width * 0.04,
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: screensize.height * 0.03,
                      right: screensize.width * 0.65,
                    ),
                    child: Text(
                      '17-24 Aug',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: screensize.height * (0.01 / 6),
                        left: screensize.width * (0.01 / 6)),
                    child: Text(
                      'Submits reports',
                      style: TextStyle(fontSize: 20, fontFamily: 'Readxpro'),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: screensize.width * 0.91,
              height: screensize.height * 0.15625,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                color: const Color(0xffBDE6F1),
              ),
              margin: EdgeInsets.only(
                top: screensize.height * 0.73125,
                left: screensize.width * 0.04,
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: screensize.height * 0.03,
                      right: screensize.width * 0.65,
                    ),
                    child: Text(
                      '24-31 Aug',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: screensize.height * (0.04 / 5),
                      left: screensize.width * 0.1,
                    ),
                    child: Text(
                      'Get supply from supplier',
                      style: TextStyle(fontSize: 20, fontFamily: 'Readxpro'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
