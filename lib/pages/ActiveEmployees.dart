import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class ActiveEmployees extends StatefulWidget {
  const ActiveEmployees({Key? key}) : super(key: key);

  @override
  State<ActiveEmployees> createState() => _ActiveEmployeesState();
}

class _ActiveEmployeesState extends State<ActiveEmployees> {


  List userList = ['Vishwaas','Vishwaas12','Vishwaas13','Vishwaas14','Abc','Abc12','Abc13','Abc14','XYZ','XYZ12','XYZ13','XYZ14'];

  List<Map<String,dynamic>> userList1 = [
    {'Sanskruti': 'A'},
    {'Antriksh': 'C'},
    {'Nakshtra': 'B'}
  ];
  
  
  List<Map<String,dynamic>> userRole = [
    { 'Junior Engineer' : 'Vishwaas' },
    { 'Junior Engineer' : 'Vishwaas12' },
    { 'Junior Engineer' : 'Vishwaas13' },
    { 'Junior Engineer' : 'Vishwaas14' },

    { 'Senior Engineer' : 'Abc'},
    { 'Senior Engineer' : 'Abc12'},
    { 'Senior Engineer' : 'Abc13'},
    { 'Senior Engineer' : 'Abc14'},

    { 'Project Manager' : 'XYZ'},
    { 'Project Manager' : 'XYZ12'},
    { 'Project Manager' : 'XYZ13'},
    { 'Project Manager' : 'XYZ14'},
  ];

  String dropdownvalue = 'Select Role';

  // List of items in our dropdown menu
  var items = [
    'Junior Engineer',
    'Senior Engineer',
    'Project Manager',
  ];

  final fkey = GlobalKey<FormState>();
  TextEditingController message = TextEditingController();
  TextEditingController number = TextEditingController();
  int inc = 0;


  get i => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: SizedBox(
      //   width: 64,
      //   height: 45,
      //   child:
      // ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: const Color(0xffE7EAEB),
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: const Color(0xffE7EAEB),
      //   title: const Text(
      //     "Active Employees",
      //     style: TextStyle(color: Colors.black),
      //   ),
      //   leading: GestureDetector(
      //     onTap: () {
      //       Navigator.pop(context);
      //     },
      //     child: const Icon(
      //       Icons.arrow_back_ios,
      //       color: Colors.black,
      //     ),
      //   ),
      // ),
      body: Container(
        margin: const EdgeInsets.only(top:20),

        child: Stack(children: [

          Positioned(
              left: 20,
              top: 13,
              child: InkWell(
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                ),
                onTap: () { Navigator.of(context).pop();},
              )
          ),
          const Positioned(
            left: 55,
            top: 10,
            child: Text(
              "Active Employees",
              style: TextStyle(fontSize: 30, fontFamily: 'OpenSans'),
            ),
          ),


          Container(

            margin:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1025-20,left: 30),
            width: MediaQuery.of(context).size.width*0.625,
            decoration: const BoxDecoration(color: Color(0xff89CFFD), borderRadius: BorderRadius.all(Radius.circular(6.0))),
            child: DropdownButton2(

              dropdownDecoration: const BoxDecoration(color: Color(0xff89CFFD)),
              style: const TextStyle(color: Colors.black),
              underline: Container(),

              icon: Padding( padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.25-dropdownvalue.length - 10), child: const Icon(Icons.keyboard_arrow_down),),
              hint: Text(dropdownvalue),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Padding(padding: const EdgeInsets.only(left: 20),child: Text(items),),
                );
              }).toList(),
              onChanged: (String? newValue) {

                setState(() {
                  dropdownvalue = newValue!;
                  userList = [];
                  if(newValue.toString()!='Select Role')
                    {
                      for(int i=0;i<userRole.length;i++)
                      {
                        if(userRole[i].keys.elementAt(0).toString() == newValue.toString())
                        {
                          userList.add(userRole[i].values.elementAt(0).toString());
                        }
                      }
                    }
                });
              },
            ),
          ),

          Container(
              margin: const EdgeInsets.only(top: 150,bottom: 20),
              child: ListView.builder(

              itemCount: userList.length,
              itemBuilder: (context , i){
                return Container(
                  margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.04444, top: 20,
                    right: MediaQuery.of(context).size.width * 0.04444,
                  ),
                  width: MediaQuery.of(context).size.width * 0.9111,
                  height: MediaQuery.of(context).size.height * 0.16875 + inc,
                  decoration: const BoxDecoration(
                    color: Color(0xff89CFFD),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Stack(

                    children: [
                      const Positioned( top : 10, left : 20,  child: Icon(Icons.circle,size: 20),),
                      Positioned(top: 13, left: 50,child: Text(userList[i].toString()),),
                      Positioned(
                        left:  MediaQuery.of(context).size.width * 0.9111-120,
                        top: 10,
                        // margin:  const EdgeInsets.only(left: 170 ),
                        // width: 150,
                        // height: 30,
                        child: SizedBox(

                          width: 100,
                            height: 30,
                            child: FloatingActionButton.extended(
                          label: const Text("New Sites",style: TextStyle(color: Colors.black,fontSize: 11),),
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          backgroundColor: const Color(0xff89CFFD),
                          icon: const Icon(Icons.add_circle,color: Colors.black,size: 24,),
                          onPressed: () {
                            showDialog(
                                barrierDismissible: true,
                                context: context,
                                builder: (_) {
                                  return AlertDialog(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))),
                                    content: Form(
                                        key: fkey,
                                        child: SizedBox(
                                          width: 100,
                                          height: 200,
                                          child: Column(
                                            children: [
                                              TextFormField(
                                                decoration:
                                                const InputDecoration(
                                                    labelText:
                                                    'Enter Site Name'),
                                                controller: message,
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return "Enter Something";
                                                  }
                                                  return null;
                                                },
                                              ),
                                              TextFormField(
                                                decoration: const InputDecoration(
                                                    labelText:
                                                    'Enter The Block Number'),
                                                controller: number,
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return "Enter Number";
                                                  }
                                                  return null;
                                                },
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceAround,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 20),
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        if (fkey.currentState!
                                                            .validate()) {
                                                          userList1.add({
                                                            message.text: number.text
                                                          });
                                                          Navigator.pop(
                                                              context);
                                                          number.clear();
                                                          message.clear();
                                                          inc = inc + 20;
                                                          setState(() {});
                                                        }
                                                      },
                                                      child:
                                                      const Text('Add'),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        top: 20),
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.pop(
                                                            context);
                                                      },
                                                      child: const Text(
                                                          'Cancel'),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        )),
                                  );
                                });
                          },
                        ),),
                      ),

                      Padding(padding: const EdgeInsets.only(top: 65),
                        child: ListView.builder(
                            itemCount: userList1.length,
                            itemBuilder: (context, j) {
                              return Align(alignment: Alignment.bottomCenter,child: Container(
                                width: MediaQuery.of(context).size.width * 0.7111,
                                margin: const EdgeInsets.only(left: 140),
                                child: Stack(
                                  children: [
                                    Positioned(child: Text(userList1[j].keys.elementAt(0).toString()),),
                                    Positioned(left: 100, child: Text(userList1[j].values.elementAt(0).toString()),)
                                  ],
                                ),
                              ),);
                            }),),

                    ],
                  ),
                );
              }

          ),)],),
      ),

    );
  }
}
