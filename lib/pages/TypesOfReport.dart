import 'package:flutter/material.dart';
class TypesOfReport extends StatefulWidget {
  const TypesOfReport({Key? key}) : super(key: key);

  @override
  State<TypesOfReport> createState() => _TypesOfReportState();
}

class _TypesOfReportState extends State<TypesOfReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: ListView(
        shrinkWrap: true,
        children: [
          Row(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Hello,Vishwas",
                ),
              ),
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
        ],
      ),
    );
  }
}
