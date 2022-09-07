import 'package:flutter/material.dart';

class EditProjectPage extends StatefulWidget {
  const EditProjectPage({Key? key}) : super(key: key);

  @override
  State<EditProjectPage> createState() => _EditProjectPageState();
}

class _EditProjectPageState extends State<EditProjectPage> {
  DateTime _dateTime = DateTime.now();

  void _showDataPicker()
  {
    showDatePicker(context: context, initialDate: _dateTime == null ? DateTime.now() : _dateTime , firstDate: DateTime(2021), lastDate: DateTime(2030)).then((data){
      setState(() {
        _dateTime = data!;
      });
    });
  }

  final TextEditingController _data = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.345,
              width: MediaQuery.of(context).size.width*0.9111,
              margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height*0.10875,left: MediaQuery.of(context).size.width*0.04444,right: MediaQuery.of(context).size.width*0.04444),
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.055,left: 30,right: 30,bottom: MediaQuery.of(context).size.height*0.03625),
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
                color: Color(0xff89CFFD),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [


                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('Edit Name',style: TextStyle(fontSize: 16)),
                  ),

                  SizedBox(height: 5,),

                  Flexible(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(color: Colors.white)),
                          ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Something";
                        }
                        return null;
                      },
                    ),
                  ),

                  SizedBox(height: 5,),

                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('Edit no. of floors',style: TextStyle(fontSize: 16)),
                  ),

                  SizedBox(height: 5,),

                  Flexible(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(color: Colors.white)),
                          ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Something";
                        }
                        return null;
                      },
                    ),
                  ),

                  SizedBox(height: 5,),

                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('Edit no. of block',style: TextStyle(fontSize: 16)),
                  ),

                  SizedBox(height: 5,),

                  Flexible(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(color: Colors.white)),
                          ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Something";
                        }
                        return null;
                      },
                    ),
                  ),

                  SizedBox(height: 5,),

                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('Time estimate',style: TextStyle(fontSize: 16)),
                  ),

                  SizedBox(height: 5,),

                  Flexible(child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: TextField(
                              controller: _data,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                suffixIcon: Icon(Icons.calendar_month),
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide(color: Colors.white)),
                              ),

                            ),
                          )
                      ),
                      Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: TextField(
                              controller: _data,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                suffixIcon: Icon(Icons.calendar_month),
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide(color: Colors.white)),
                              ),

                            ),
                          )
                      ),
                    ],
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
