import 'package:flutter/material.dart';
import 'package:flutter_app/Server%20(Back%20End)/network_handler.dart';
import 'package:flutter_app/pages/Dashboard/New_items.dart';
import 'package:flutter_app/pages/Item_details.dart';

// ignore: must_be_immutable
class ItemPage extends StatefulWidget {
  String projectName;

  ItemPage({Key? key, required this.projectName}) : super(key: key);

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  List<Map<String, int>> userList1 = [
    {'Cement': 10},
    {'Sand': 15},
    {'Axe': 18},
    {'Tiles': 10},
    {'Woods': 15},
    {'Concrete': 18},
    {'Stone': 10},
    {'Bricks': 15},
  ];

  String search = "";

  List temp = [];

  NetworkHandler p = NetworkHandler();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xffE5E5E5),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.0825 + 10,
                left: 16,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          search = value;
                        });
                      },
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          prefixIcon:
                              Icon(Icons.search, color: Colors.black, size: 30),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(color: Colors.white)),
                          labelText: 'Search'),
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
                      height: 49,
                      width: 99,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.111111,
                          right: 16),
                      child: Stack(
                        children: const [
                          Align(
                            alignment: Alignment(-0.90, 0),
                            child: Icon(
                              Icons.add_circle,
                              size: 30,
                            ),
                          ),
                          Align(
                            alignment: Alignment(0.50, 0),
                            child: Text('Add\nItem'),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Additem(
                                    projectName: widget.projectName.toString(),
                                  )));
                    },
                  ),
                ],
              ),
            ),
            Positioned(
                top: MediaQuery.of(context).size.height * 0.17875 + 15,
                left: 25,
                child: const Text(
                  'My items',
                  style: TextStyle(fontSize: 25),
                )),
            Positioned(
                left: 20,
                top: 23,
                child: InkWell(
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                )),
            FutureBuilder<List>(
                future: p.listitem({"project_name": widget.projectName}),
                builder: (context, snapshot) {
                  // if(ConnectionState.waiting == snapshot.connectionState)
                  //   {
                  //     return CircularProgressIndicator();
                  //   }
                  if (snapshot.hasData) {
                    temp.clear();
                    for (int i = 0; i < snapshot.data!.length; i++) {
                      if (snapshot.data![i]["item_name"]
                              .toString()
                              .toLowerCase()
                              .contains(search.toLowerCase()) ||
                          snapshot.data![i]["item_code"]
                              .toString()
                              .toLowerCase()
                              .contains(search.toLowerCase())) {
                        temp.add(snapshot.data![i]);
                      }
                    }

                    return Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.23375,
                          bottom: MediaQuery.of(context).size.height * 0.05625,
                          right: MediaQuery.of(context).size.height * 0.020,
                          left: MediaQuery.of(context).size.height * 0.020),
                      child: GridView.builder(
                        addRepaintBoundaries: false,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, mainAxisSpacing: 15),
                        itemCount: temp.length,
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 0.17125,
                            //137
                            width: MediaQuery.of(context).size.width * 0.44444,
                            //160
                            //margin: const EdgeInsets.only(left: 20, right: 20),
                            child: InkWell(
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                elevation: 10.0,
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, right: 10),
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Image.asset(
                                            'assets/images/inventory_logo.png'),
                                      ),
                                    ),
                                    Positioned(
                                      top: 30,
                                      left: 20,
                                      child: Text(
                                        temp[index]["item_name"].toString(),
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontFamily: 'ReadexPro'),
                                      ),
                                    ),
                                    Positioned(
                                      top: 60,
                                      left: 20,
                                      child: Text(
                                        temp[index]["item_code"].toString(),
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'ReadexPro'),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, bottom: 15),
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          "Used - ${temp[index]["used_items"]}\nTotal - ${temp[index]["total_quantity"]}",
                                          style: const TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'Inter',
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ItemDetailPage(
                                            proj: widget.projectName.toString(),
                                            cont: temp[index]["item_name"]
                                                .toString(),
                                            code: temp[index]["item_code"]
                                                .toString())));
                              },
                            ),
                            // child : Card(child: Center(child: Text(userList1[index].keys.elementAt(0).toString())))
                          );
                        },
                      ),
                    );
                  }

                  if (ConnectionState.waiting == snapshot.connectionState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return const Text("Something Went Wrong");
                  }
                }),
          ],
        ),
      ),
    );
  }
}
