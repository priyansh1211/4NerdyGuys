import 'package:flutter/material.dart';
import 'package:flutter_app/pages/drawerpage.dart';
import 'package:intl/intl.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);
  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  List listforstartdate = [];
  List listforendDate = [];
  List listfortask = [];
  final fkey = GlobalKey<FormState>();
  final _dateC1 = TextEditingController();
  final _dateC2 = TextEditingController();
  final _taskdetail = TextEditingController();
//for start date , date picker
  Future displayDatePicker1(BuildContext context) async {
    var date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (date != null) {
      var formatteddate = DateFormat('dd/MM/yyyy').format(date);
      setState(() {
        _dateC1.text = formatteddate.toString().split(" ")[0];
      });
    }
  }

// for end date , date picker
  Future displayDatePicker2(BuildContext context) async {
    var date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (date != null) {
      var formatteddate = DateFormat('dd/MM/yyyy').format(date);
      setState(() {
        _dateC2.text = formatteddate.toString().split(" ")[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: const DrawerPage(),
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
                  icon: const Icon(Icons.menu),
                  iconSize: 30,
                  color: const Color(0xff000000),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                ),
              ),
            ),
            Positioned(
              left: 30,
              top: screensize.height * 0.118,
              child: const Text(
                'Tasks',
                style: TextStyle(fontFamily: 'Opensans', fontSize: 25),
              ),
            ),
            Positioned(
              left: screensize.width * 0.59,
              top: screensize.height * 0.118,
              child: InkWell(
                child: Row(
                  children: [
                    Container(
                      child: const Icon(Icons.calendar_today, size: 25),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: screensize.width * 0.02),
                      child: const Text(
                        'Add Task',
                        style: TextStyle(fontFamily: 'Opensans', fontSize: 25),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  showDialog(
                      barrierDismissible: true,
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          content: Form(
                            key: fkey,
                            child: SizedBox(
                              width: 100,
                              height: 330,
                              child: Column(
                                children: [
                                  TextFormField(
                                    decoration: const InputDecoration(
                                        labelText: 'Select Start date ',
                                        suffixIcon:
                                            Icon(Icons.calendar_month_rounded)),
                                    controller: _dateC1,
                                    onTap: () async {
                                      displayDatePicker1(context);
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Select Start Date";
                                      }
                                      return null;
                                    },
                                  ),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                        labelText: 'Select End date ',
                                        suffixIcon:
                                            Icon(Icons.calendar_month_rounded)),
                                    controller: _dateC2,
                                    onTap: () async {
                                      displayDatePicker2(context);
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Select End Date";
                                      }
                                      return null;
                                    },
                                  ),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: "Enter Task Detail",
                                    ),
                                    controller: _taskdetail,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Enter about Task";
                                      }
                                      return null;
                                    },
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            if (fkey.currentState!.validate()) {
                                              listforstartdate
                                                  .add(_dateC1.text.toString());
                                              listforendDate
                                                  .add(_dateC2.text.toString());
                                              listfortask.add(
                                                  _taskdetail.text.toString());
                                              Navigator.pop(context);
                                              _dateC1.clear();
                                              _dateC2.clear();
                                              _taskdetail.clear();
                                              setState(() {});
                                            }
                                          },
                                          child: const Text('Add'),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 20,
                                        ),
                                        child: ElevatedButton(
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
                      });
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.19,
                bottom: MediaQuery.of(context).size.height * 0.10,
                //right: MediaQuery.of(context).size.height * 0.020,
                //left: MediaQuery.of(context).size.height * 0.020,
              ),
              child: ListView.builder(
                itemCount: listforstartdate.length,
                itemBuilder: (BuildContext context, int index) {
                  var endDate = listforendDate[index];
                  return Container(
                    height: 100,
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    child: InkWell(
                      child: Card(
                        color: const Color(0xffA6D1E6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        //elevation: 10.0,
                        child: Stack(
                          children: [
                            Positioned(
                              top: MediaQuery.of(context).size.height * 0.038,
                              left: MediaQuery.of(context).size.width * 0.05,
                              child: Text(
                                listforstartdate[index].toString(),
                                style: const TextStyle(
                                    fontSize: 18, fontFamily: 'Opensans'),
                              ),
                            ),
                            Positioned(
                              top: MediaQuery.of(context).size.height * 0.038,
                              left: MediaQuery.of(context).size.width * 0.3,
                              child: Text(
                                ' - $endDate',
                                style: const TextStyle(
                                    fontSize: 18, fontFamily: 'Opensans'),
                              ),
                            ),
                            Positioned(
                              top: MediaQuery.of(context).size.height * 0.078,
                              left: MediaQuery.of(context).size.width * 0.3,
                              child: Text(
                                listfortask[index].toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Opensans',
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {},
                    ),
                    // child : Card(child: Center(child: Text(userList1[index].keys.elementAt(0).toString())))
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
