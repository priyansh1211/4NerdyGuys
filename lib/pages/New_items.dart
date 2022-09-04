import 'package:flutter/material.dart';

class Additem extends StatefulWidget {
  const Additem({Key? key}) : super(key: key);

  @override
  State<Additem> createState() => _AdditemState();
}

class _AdditemState extends State<Additem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(//SingleChildScrollView()
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                color: const Color(0xffE5E5E5),
              ),
              Positioned(
                  left: 20,
                  top: 25,
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
                top: MediaQuery.of(context).size.height * 0.07375,
                left: MediaQuery.of(context).size.width * 0.05555,
                child: const Text('Add new item',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              ),
              Positioned(
                  top: MediaQuery.of(context).size.height * 0.07375,
                  left: MediaQuery.of(context).size.width * 0.85555,
                  child: Image.asset('assets/images/calendar_add_item.png')),
              Container(
                // height: MediaQuery.of(context).size.height*0.4325,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                ),

                height: MediaQuery.of(context).size.height * 0.7375,

                padding: EdgeInsets.only(
                  top: 41,
                  bottom: MediaQuery.of(context).size.height * 0.18,
                ),
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.2625,
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(color: Colors.black)),
                            labelText: 'Item name'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Something";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(color: Colors.black)),
                            labelText: 'Item code'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Something";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(color: Colors.black)),
                            labelText: 'Item group'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Something";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(color: Colors.black)),
                            labelText: 'Item description'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Something";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(color: Colors.black)),
                            labelText: 'Total quantity'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Something";
                          }
                          return null;
                        },
                      ),
                    ),
                    InkWell(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.87,
                        height: 50,
                        margin: const EdgeInsets.only(top: 20),
                        decoration: const BoxDecoration(
                            color: Color(0xffA6D1E6),
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: const Center(
                          child: Text('Add item', style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      onTap: (){},
                    ),
                  ],
                ),
              ),
            ],
          )),
        );
  }
}
