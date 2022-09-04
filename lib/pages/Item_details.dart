import 'package:flutter/material.dart';

class ItemDetailPage extends StatefulWidget {
  const ItemDetailPage({Key? key}) : super(key: key);

  @override
  State<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              //height: MediaQuery.of(context).size.height*0.33,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
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

                  Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.13,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                                filled: true,
                                fillColor: Color(0xffA6D1E6),
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                labelText: 'Enter available items'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter Something";
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                          child: TextFormField(
                            decoration: const InputDecoration(
                                filled: true,
                                fillColor: Color(0xffA6D1E6),
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide(color: Colors.white)),
                                labelText: 'Enter total items'),
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
                            decoration: const BoxDecoration(
                                color: Color(0xffA6D1E6),
                                borderRadius: BorderRadius.all(Radius.circular(10))),
                            child: const Center(
                              child: Text('Submit', style: TextStyle(fontSize: 20)),
                            ),
                          ),
                          onTap: (){},
                        ),

                        Container(

                          height: 300,
                          width: MediaQuery.of(context).size.width,
                          color: Color(0xffA6D1E6),

                        ),

                      ],
                    ),
                  ),


                ],
              )
          ),

        ],
      )
    );
  }
}
