import 'package:flutter/material.dart';
class ActiveEmployees extends StatefulWidget {
  const ActiveEmployees({Key? key}) : super(key: key);

  @override
  State<ActiveEmployees> createState() => _ActiveEmployeesState();
}

class _ActiveEmployeesState extends State<ActiveEmployees> {
  List User_Name_List = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F'
  ];
  List Site_name = ['Sanskruti', 'Antriksh', 'Bougainvilla'];
  List Block_no = ['A', 'B', 'C'];

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
              padding: const EdgeInsets.only(left: 15),
              height: 35,
              width: 225,
              margin: const EdgeInsets.only(right: 125),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child:  Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(text: 'Junior Engineer',style: TextStyle(color: Colors.black, fontSize: 20)),
                    WidgetSpan(child: SizedBox(width: MediaQuery.of(context).devicePixelRatio,)),
                    WidgetSpan(child:Icon(Icons.arrow_drop_down),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: User_Name_List.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    height: 135,
                    width: 328,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xff89CFFD),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.circle_rounded),
                            Text(User_Name_List[i]),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(
                            padding: const EdgeInsets.only(left: 15),
                            height: 35,
                            width: 225,
                            margin: const EdgeInsets.only(right: 125),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade100,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child:  Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(text: 'Junior Engineer',style: TextStyle(color: Colors.black, fontSize: 20)),
                                  WidgetSpan(child: SizedBox(width: MediaQuery.of(context).devicePixelRatio,)),
                                  WidgetSpan(child:Icon(Icons.arrow_drop_down),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        ListView.builder(
                            itemBuilder: (context,i){
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Text(Site_name[i]),
                                      SizedBox(width: 20,),
                                      Text(Block_no[i]),
                                    ],
                                  ),
                                ],
                              );
                            })
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
