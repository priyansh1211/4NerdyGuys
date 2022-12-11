
// ignore_for_file: must_be_immutable

import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:flutter/material.dart';
import 'package:flutter_app/Server%20(Back%20End)/network_handler.dart';
import 'package:flutter_app/pages/second_project_blocks.dart';

class AddProjectBlocks extends StatefulWidget {

  String name = "";

  String email = "";

  String designation= "";

  AddProjectBlocks({Key? key, required this.name, required this.email, required this.designation}) : super(key: key);

  @override
  State<AddProjectBlocks> createState() => _AddProjectBlocksState();
}

class _AddProjectBlocksState extends State<AddProjectBlocks> {
  String dropdownvalue = 'Select Project';

  NetworkHandler p = NetworkHandler();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List>(builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: MediaQuery
              .of(context)
              .size
              .height,
          color: Colors.white,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      if (snapshot.hasData) {

         List<String> items= [];
         List<String> val = [];
         snapshot.data?.forEach((element) { items.add(element["project_name"].toString());
         val.add(element["blocks"].toString());
         });
         final Map<String, String> z = Map.fromIterables(items, val);

         List <String> newblocks = [];

        return Scaffold(
          body: Stack(
            children: [
              Container(
                color: const Color(0xffE5E5E5),
              ),

              Positioned(
                  left: 20,
                  top: 15,
                  child: InkWell(
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  )),

              Positioned(
                top: MediaQuery.of(context).size.height * 0.1,
                left: 20,
                child: Text(widget.name,style: const TextStyle(fontSize: 30),),),

              Positioned(
                top: MediaQuery.of(context).size.height * 0.145,
                left: 22,
                child: Text(widget.designation),),

              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery
                        .of(context)
                        .size
                        .height * 0.195,
                    left: MediaQuery
                        .of(context)
                        .size
                        .width * 0.04444,
                    right: MediaQuery
                        .of(context)
                        .size
                        .width * 0.04444),
                padding: const EdgeInsets.only(
                    top: 20,
                    left: 20,
                    right: 20,
                    bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color(0xffAECAEC),
                ),
                child: DropdownButton2(
                  buttonWidth: MediaQuery.of(context).size.width * 0.69722,
                  dropdownDecoration:
                  const BoxDecoration(color: Color(0xffAECAEC)),
                  style: const TextStyle(color: Colors.black),
                  underline: Container(),
                  icon:  const Icon(Icons.keyboard_arrow_down),
                  hint: Text(dropdownvalue),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(items),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                      for(int i=65;i<int.parse(z[dropdownvalue]!)+65;i++)
                      {
                        newblocks.add(String.fromCharCode(i));
                      }
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SecondProjectBlocks(index: newblocks,projectName: dropdownvalue,email: widget.email.toString(),name : widget.name.toString(),designation : widget.designation.toString())));
                    });
                  },
                ),
              ),
            ],
          ),
        );
      }

      return const Text("Something Went Wrong");
    },

      stream: p.listforActiveDropDown(),);
  }

}
