import 'package:flutter/material.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);
  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
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
                      child: Text(
                        '+ Add Task',
                        style: TextStyle(fontFamily: 'Readxpro', fontSize: 25),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: screensize.width * 0.91,
              height: screensize.height * 0.17625,
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
                    margin: EdgeInsets.only(
                      top: screensize.height * (0.01 / 6),
                    ),
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
              height: screensize.height * 0.17625,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                color: const Color(0xffBDE6F1),
              ),
              margin: EdgeInsets.only(
                top: screensize.height * 0.37125,
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
                        top: screensize.height * (0.01 / 6),
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
              height: screensize.height * 0.17625,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                color: const Color(0xffBDE6F1),
              ),
              margin: EdgeInsets.only(
                top: screensize.height * 0.56125,
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
              height: screensize.height * 0.17625,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                color: const Color(0xffBDE6F1),
              ),
              margin: EdgeInsets.only(
                top: screensize.height * 0.76125,
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
