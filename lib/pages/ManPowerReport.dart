import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/MachineryReport.dart';

class ManPowerReport extends StatefulWidget {
  const ManPowerReport({Key? key}) : super(key: key);

  @override
  State<ManPowerReport> createState() => _ManPowerReportState();
}

class _ManPowerReportState extends State<ManPowerReport> {
  final List<String> items = [
    'Add new column',
  ];
  final List<String> Agency =[
    'Steel',
    'Shuttering',
    'Concrete',
    'Brick Masonary',
  ];

  String? selectedValue;

  List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> items) {
    List<DropdownMenuItem<String>> menuItems = [];
    for (var item in items) {
      menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
          //If it's last item, we will not add Divider after it.
          if (item != items.last)
            const DropdownMenuItem<String>(
              enabled: false,
              child: Divider(),
            ),
        ],
      );
    }
    return menuItems;
  }

  List<int> _getDividersIndexes() {
    List<int> dividersIndexes = [];
    for (var i = 0; i < (items.length * 2) - 1; i++) {
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        dividersIndexes.add(i);
      }
    }
    return dividersIndexes;
  }

  //String? _chosenValue;
  @override
  Widget build(BuildContext context) {
    final number1 = TextEditingController();
    final number2 = TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xffE5E5E5),
        title: const Text(
          "Man Power Report:",
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
              padding: const EdgeInsets.only(left: 20),
              height: 50,
              margin: const EdgeInsets.only(right: 160),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  hint: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Add Data',
                    ),
                  ),
                  items: _addDividersAfterItems(items),
                  customItemsIndexes: _getDividersIndexes(),
                  customItemsHeight: 4,
                  value: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value as String;
                    });
                  },
                  buttonHeight: 40,
                  buttonWidth: 140,
                  itemHeight: 40,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25),
            child: Text(
              'Agency',
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.only(left: 20),
              height: 50,
              margin: const EdgeInsets.only(right: 100),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  hint: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '-Select Agency-',
                    ),
                  ),
                  items: _addDividersAfterItems(Agency),
                  customItemsIndexes: _getDividersIndexes(),
                  customItemsHeight: 4,
                  value: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value as String;
                    });
                  },
                  buttonHeight: 40,
                  buttonWidth: 140,
                  itemHeight: 40,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 24),
            child: Text(
              'Description',
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.only(left: 20),
              height: 50,
              margin: const EdgeInsets.only(right: 100),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: '-Give Work Description-',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          //SizedBox(height: 10,),
          const Padding(
            padding: EdgeInsets.only(left: 24),
            child: Text(
              'Skilled',
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
              height: 55,
              margin: const EdgeInsets.only(right: 260),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: number1,
                autocorrect: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '1',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          //SizedBox(height: 10,),
          const Padding(
            padding: EdgeInsets.only(left: 24),
            child: Text(
              'Unskilled',
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.only(left: 10,top: 8,bottom: 8),
              height: 55,
              margin: const EdgeInsets.only(right: 260),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child:  TextField(
                controller: number2,
                autocorrect: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '1',
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
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.only(left: 20),
              height: 50,
              margin: const EdgeInsets.only(right: 100),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const TextField(
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MaterialButton(
            onPressed: () {
              AlertDialog(
                title: const Text('Do you want to continue?'),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MachineryReport()));
                      },
                      child: const Text(
                        'Yes',
                        style: TextStyle(
                            color: Color(0xff685D5D), fontFamily: 'ReadexPro'),
                      ),
                  ),
                  ElevatedButton(onPressed: (){
                   // Navigator.push(context, MaterialPageRoute(builder: (context)=>))
                  }, child: const Text(
                    'Yes',
                    style: TextStyle(
                        color: Color(0xff685D5D), fontFamily: 'ReadexPro'),
                  ),
                  ),
                ],
              );
            },
            child: Container(
              height: 52,
              width: 130,
              margin: const EdgeInsets.symmetric(horizontal: 105),
              decoration: BoxDecoration(
                color: Colors.blue.shade600,
                borderRadius: BorderRadius.circular(35.0),
              ),
              child: const Center(
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
