import 'package:flutter/material.dart';
import 'package:flutter_app/pages/drawerpage.dart';
class ProjectProgress extends StatefulWidget {
  const ProjectProgress({Key? key}) : super(key: key);

  @override
  State<ProjectProgress> createState() => _ProjectProgressState();
}

class _ProjectProgressState extends State<ProjectProgress> {
  List<String> Blocks = ['A', 'B', 'C', 'D', 'E', 'F'];

  String selectedValue="Select a block";


  // final List<TextEditingController> _controllers = [];
  // final List<TextField> _fields = [];
  final _dateChoose = TextEditingController();
  final _dateFloor = TextEditingController();
  final _dateMilestone = TextEditingController();
  // final _timeC = TextEditingController();

  ///Date
  DateTime selected = DateTime.now();
  DateTime initial = DateTime(2000);
  DateTime last = DateTime(2025);

  ///Time
  TimeOfDay timeOfDay = TimeOfDay.now();

  Future displayDateChoose(BuildContext context) async {
    var date1 = await showDatePicker(
      context: context,
      initialDate: selected,
      firstDate: initial,
      lastDate: last,
    );
    // var date2 = await showDatePicker(
    //   context: context,
    //   initialDate: selected,
    //   firstDate: initial,
    //   lastDate: last,
    // );
    // var date3 = await showDatePicker(
    //   context: context,
    //   initialDate: selected,
    //   firstDate: initial,
    //   lastDate: last,
    // );

    if (date1 != null) {
      setState(() {
        _dateChoose.text = date1.toLocal().toString().split(" ")[0];
      });
    }
    // if (date2 != null) {
    //   setState(() {
    //     _dateFloor.text = date2.toLocal().toString().split(" ")[0];
    //   });
    // }
    // if (date3 != null) {
    //   setState(() {
    //     _dateMilestone.text = date3.toLocal().toString().split(" ")[0];
    //   });
    // }
  }
  Future displayDateFloor(BuildContext context) async {
    var date1 = await showDatePicker(
      context: context,
      initialDate: selected,
      firstDate: initial,
      lastDate: last,
    );
    // var date2 = await showDatePicker(
    //   context: context,
    //   initialDate: selected,
    //   firstDate: initial,
    //   lastDate: last,
    // );
    // var date3 = await showDatePicker(
    //   context: context,
    //   initialDate: selected,
    //   firstDate: initial,
    //   lastDate: last,
    // );

    if (date1 != null) {
      setState(() {
        _dateFloor.text = date1.toLocal().toString().split(" ")[0];
      });
    }
    // if (date2 != null) {
    //   setState(() {
    //     _dateFloor.text = date2.toLocal().toString().split(" ")[0];
    //   });
    // }
    // if (date3 != null) {
    //   setState(() {
    //     _dateMilestone.text = date3.toLocal().toString().split(" ")[0];
    //   });
    // }
  }
  Future displayDateMilestone(BuildContext context) async {
    var date1 = await showDatePicker(
      context: context,
      initialDate: selected,
      firstDate: initial,
      lastDate: last,
    );
    // var date2 = await showDatePicker(
    //   context: context,
    //   initialDate: selected,
    //   firstDate: initial,
    //   lastDate: last,
    // );
    // var date3 = await showDatePicker(
    //   context: context,
    //   initialDate: selected,
    //   firstDate: initial,
    //   lastDate: last,
    // );

    if (date1 != null) {
      setState(() {
        _dateMilestone.text = date1.toLocal().toString().split(" ")[0];
      });
    }
    // if (date2 != null) {
    //   setState(() {
    //     _dateFloor.text = date2.toLocal().toString().split(" ")[0];
    //   });
    // }
    // if (date3 != null) {
    //   setState(() {
    //     _dateMilestone.text = date3.toLocal().toString().split(" ")[0];
    //   });
    // }
  }

  //final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  //static List<String> friendsList = [];

  int number_foundation = 1;
  int number_milestone = 1;
  TextEditingController msg_foundation = TextEditingController();
  TextEditingController msg_milestone = TextEditingController();
  final fkey = GlobalKey<FormState>();
  List<String> foundation_name = [''];
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
      endDrawer: const DrawerPage(),
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
                    shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),),
                  child:const Icon(Icons.person,size:30,color:Colors.blue),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
             children: [
               Row(
                 //crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                   DropdownButton(
                     hint:Text(selectedValue),
                     // value: selectedValue,
                     icon: const Icon(Icons.keyboard_arrow_down),
                     items: Blocks.map((String items){
                       return DropdownMenuItem(
                         value: items,
                         child: Text(items),
                       );
                     }).toList(),
                     onChanged: (String? newValue){
                       setState((){
                         selectedValue = newValue!;
                         //selectedValue=newValue!;
                       });
                     },
                   ),
                   const SizedBox(width: 145),
                 ],
               ),
               SizedBox(height: 10,),
               Padding(
                 padding: const EdgeInsets.only(right: 220),
                 child: Text.rich(
                   TextSpan(
                     children: [
                       const TextSpan(
                         locale: Locale(AutofillHints.birthdayYear),
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
                     controller: _dateChoose,
                     onTap: () {
                       displayDateChoose(context);
                     },
                   ),
                 ),
               ),
               Row(
                 children: [
                   Container(
                     width: MediaQuery.of(context).size.width,
                     child: Padding(
                         padding: const EdgeInsets.only(right: 290),
                         child: Text.rich(
                           TextSpan(
                             children: [
                               const TextSpan(
                                 //locale: Locale(AutofillHints.birthdayYear),
                                   text: 'Floor',
                                   style: TextStyle(color: Colors.black, fontSize: 20)),
                               // WidgetSpan(
                               //     child: SizedBox(
                               //       width: MediaQuery
                               //           .of(context)
                               //           .devicePixelRatio,
                               //     )),
                               WidgetSpan(child: OutlinedButton(
                                   onPressed: () {
                                     {
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
                                                           decoration: const InputDecoration(
                                                               labelText: 'Enter Foundation Name'),
                                                           controller: msg_foundation,
                                                           validator: (value) {
                                                             if (value == null ||
                                                                 value.isEmpty) {
                                                               return "Enter Something";
                                                             }
                                                             return null;
                                                           },
                                                         ),
                                                         Row(
                                                           mainAxisAlignment:
                                                           MainAxisAlignment.spaceAround,
                                                           crossAxisAlignment: CrossAxisAlignment
                                                               .end,
                                                           children: [
                                                             Padding(
                                                               padding: const EdgeInsets.only(
                                                                   top: 20),
                                                               child: ElevatedButton(
                                                                 onPressed: () {
                                                                   if (fkey.currentState!
                                                                       .validate()) {
                                                                     foundation_name.add(
                                                                         msg_foundation.text);
                                                                     Navigator.pop(context);
                                                                     msg_foundation.clear();
                                                                     setState(() {
                                                                       number_foundation = number_foundation + 1;
                                                                     });
                                                                   }
                                                                 },
                                                                 child: const Text('Add'),
                                                               ),
                                                             ),
                                                             Padding(
                                                               padding: const EdgeInsets.only(
                                                                   top: 20),
                                                               child: ElevatedButton(
                                                                 onPressed: () {
                                                                   Navigator.pop(context);
                                                                 },
                                                                 child: const Text('Cancel'),
                                                               ),
                                                             )
                                                           ],
                                                         ),
                                                       ],
                                                     ),
                                                   )),
                                             );
                                           });
                                     }
                                   },
                                   child: const Text.rich(
                                     TextSpan(
                                       children: [
                                         TextSpan(
                                           //text: 'Floor',
                                             style: TextStyle(
                                                 color: Colors.black, fontSize: 20)),
                                         WidgetSpan(child: Icon(Icons.add)),
                                         // TextSpan(text: 'to add'),
                                       ],
                                     ),
                                   )
                               ),
                               ),
                               // WidgetSpan(
                               //     child: SizedBox(
                               //       width: MediaQuery
                               //           .of(context)
                               //           .devicePixelRatio,
                               //     )),
                             ],
                           ),
                         )
                     ),
                   ),
                 ],
               ),
               ListView.builder(
                 physics: const ScrollPhysics(parent: null),
                 shrinkWrap: true,
                 itemBuilder: (BuildContext context, int i) {
                   return SingleChildScrollView(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [

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
                                   //suffixIcon: Icon(Icons.add)
                               ),
                             ),
                           ),
                         ),
                         // Padding(
                         //   padding: const EdgeInsets.only(left: 25),
                         //   child: Text.rich(
                         //     TextSpan(
                         //       children: [
                         //         const TextSpan(
                         //           //text: 'Choose Date',
                         //             style: TextStyle(color: Colors.black, fontSize: 20)),
                         //         WidgetSpan(
                         //             child: SizedBox(
                         //               width: MediaQuery
                         //                   .of(context)
                         //                   .devicePixelRatio,
                         //             )),
                         //         // const WidgetSpan(child: Icon(Icons.date_range)),
                         //         // TextSpan(text: 'to add'),
                         //       ],
                         //     ),
                         //   ),
                         // ),
                         // Padding(
                         //   padding: const EdgeInsets.all(20),
                         //   child: ,
                         // ),
                         Row(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                             SizedBox(width: MediaQuery.of(context).size.width*0.04,),
                             Expanded(child: Padding(
                               padding:const EdgeInsets.only(bottom: 2,top: 5),
                               child: Container(
                                 padding: const EdgeInsets.only(left: 1),
                                 height: 50,
                                 margin: const EdgeInsets.all(1),
                                 decoration: BoxDecoration(
                                   color: Colors.white,
                                   borderRadius: BorderRadius.circular(20),
                                 ),
                                 child: TextField(
                                   style: const TextStyle(color: Colors.black54),
                                   decoration: const InputDecoration(
                                     hintTextDirection: TextDirection.rtl,
                                     hintText: 'Date',
                                     border: InputBorder.none,
                                     suffixIcon: Icon(Icons.calendar_month_rounded),
                                   ),
                                   controller: _dateFloor,
                                   onTap: () {
                                     displayDateFloor(context);
                                   },
                                 ),
                               ),
                             )),
                             SizedBox(width: MediaQuery.of(context).size.width*0.094,),
                             const Expanded(child: Text("To",style: TextStyle(),)),
                             Expanded(child: Container(
                               // padding: const EdgeInsets.only(left: 12),
                               height: 55,
                               //margin: const EdgeInsets.only(right: 180),
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
                                 controller: _dateFloor,
                                 onTap: () {
                                   displayDateFloor(context);
                                 },
                               ),
                             )),
                             const SizedBox(width: 20,),
                           ],
                         ),
                       ],
                     ),
                   );
                 },
                 itemCount: number_foundation,
               ),
               SizedBox(height: 10,),
               Padding(
                 padding: const EdgeInsets.only(left: 15),
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
               Row(
                 children: [
                   Container(
                     width: MediaQuery.of(context).size.width,
                     child:Padding(
                         padding: const EdgeInsets.only(right: 290),
                         child: Text.rich(
                           TextSpan(
                             children: [
                               const TextSpan(text: 'Milestones',style: TextStyle(color: Colors.black)),
                               //WidgetSpan(child: SizedBox(width: MediaQuery.of(context).devicePixelRatio,)),
                               WidgetSpan(child: OutlinedButton(
                                   onPressed: () {
                                     {
                                       showDialog(
                                           barrierDismissible: true,
                                           context: context,
                                           builder: (_) {
                                             return AlertDialog(
                                               shape: const RoundedRectangleBorder(
                                                   borderRadius: BorderRadius.all(
                                                       Radius.circular(5.0))),
                                               content: Form(
                                                   key: fkey,
                                                   child: SizedBox(
                                                     width: 90,
                                                     height: 180,
                                                     child: Column(
                                                       children: [
                                                         TextFormField(
                                                           decoration: const InputDecoration(
                                                               labelText: 'Enter Milestone Name'),
                                                           controller: msg_foundation,
                                                           validator: (value) {
                                                             if (value == null ||
                                                                 value.isEmpty) {
                                                               return "Enter Something";
                                                             }
                                                             return null;
                                                           },
                                                         ),
                                                         Row(
                                                           mainAxisAlignment:
                                                           MainAxisAlignment.spaceAround,
                                                           crossAxisAlignment: CrossAxisAlignment
                                                               .end,
                                                           children: [
                                                             Padding(
                                                               padding: const EdgeInsets.only(
                                                                   top: 20),
                                                               child: ElevatedButton(
                                                                 onPressed: () {
                                                                   if (fkey.currentState!
                                                                       .validate()) {
                                                                     foundation_name.add(
                                                                         msg_foundation.text);
                                                                     Navigator.pop(context);
                                                                     msg_foundation.clear();
                                                                     setState(() {
                                                                       number_foundation = number_foundation + 1;
                                                                     });
                                                                   }
                                                                 },
                                                                 child: const Text('Add'),
                                                               ),
                                                             ),
                                                             Padding(
                                                               padding: const EdgeInsets.only(
                                                                   top: 20),
                                                               child: ElevatedButton(
                                                                 onPressed: () {
                                                                   Navigator.pop(context);
                                                                 },
                                                                 child: const Text('Cancel'),
                                                               ),
                                                             )
                                                           ],
                                                         ),
                                                       ],
                                                     ),
                                                   )),
                                             );
                                           });
                                     }
                                   },
                                   child: const Text.rich(
                                     TextSpan(
                                       children: [
                                         TextSpan(
                                           //text: 'Floor',
                                             style: TextStyle(
                                                 color: Colors.black, fontSize: 20)),
                                         WidgetSpan(child: Icon(Icons.add,size: 25,color: Colors.black,)),
                                         // TextSpan(text: 'to add'),
                                       ],
                                     ),
                                   )),),
                               // TextSpan(text: 'to add'),
                             ],
                           ),
                         )
                     ) ,
                   ),
                 ],
               ),
               ListView.builder(
                 physics: const ScrollPhysics(parent: null),
                 shrinkWrap: true,
                 itemBuilder: (BuildContext context, int i) {
                   return SingleChildScrollView(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         const SizedBox(height: 20,),
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
                                   ),
                             ),
                           ),
                         ),
                         // Padding(
                         //   padding: const EdgeInsets.all(20),
                         //   child: Container(
                         //     padding: const EdgeInsets.only(left: 12),
                         //     height: 55,
                         //     margin: const EdgeInsets.only(right: 180),
                         //     decoration: BoxDecoration(
                         //       color: Colors.white,
                         //       borderRadius: BorderRadius.circular(20),
                         //     ),
                         //     child: TextField(
                         //       style: const TextStyle(color: Colors.black54),
                         //       decoration: const InputDecoration(
                         //         hintText: 'Date',
                         //         border: InputBorder.none,
                         //         suffixIcon: Icon(Icons.calendar_month_rounded),
                         //       ),
                         //       controller: _dateMilestone,
                         //       onTap: () {
                         //         displayDateMilestone(context);
                         //       },
                         //     ),
                         //   ),
                         // ),
                         Row(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                             Expanded(child: Container(
                               // padding: const EdgeInsets.only(left: 12),
                               height: 50,
                               //margin: const EdgeInsets.only(right: 180),
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
                                 controller: _dateFloor,
                                 onTap: () {
                                   displayDateFloor(context);
                                 },
                               ),
                             )),
                             const Expanded(child: Text("To",style: TextStyle(),)),
                             Expanded(child: Container(
                               // padding: const EdgeInsets.only(left: 12),
                               height: 55,
                               //margin: const EdgeInsets.only(right: 180),
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
                                 controller: _dateFloor,
                                 onTap: () {
                                   displayDateFloor(context);
                                 },
                               ),
                             )),
                           ],
                         ),
                       ],
                     ),
                   );
                 },
                 itemCount: number_milestone,
               ),
             ],
        ),
      ),
    );
  }
}