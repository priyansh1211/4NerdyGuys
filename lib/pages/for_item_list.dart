import 'package:flutter/material.dart';

class ItemForGrid extends StatefulWidget {
  List snapshot;
  ItemForGrid({Key? key, required this.snapshot}) : super(key: key);

  @override
  State<ItemForGrid> createState() => _ItemForGridState();
}

class _ItemForGridState extends State<ItemForGrid> {
  String search = "";
  List  temp = [];

  @override
  void initState() {
    super.initState();
    temp = widget.snapshot;
  }




  @override
  Widget build(BuildContext context) {
    return Stack(
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
                  onChanged: (value){
                    temp.clear();
                    setState(() {
                      search = value;
                    });

                    for(int i=0;i<widget.snapshot.length;i++)
                    {
                      if(widget.snapshot[i]["item_name"].toString().contains(search) | search.isEmpty )
                      {
                        temp.add(widget.snapshot[i]);
                      }
                    }

                  },
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search,
                          color: Colors.black, size: 30),
                      enabledBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(8)),
                          borderSide:
                          BorderSide(color: Colors.white)),
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
                      borderRadius:
                      BorderRadius.all(Radius.circular(10))),
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width *
                          0.111111,
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
                  // Navigator.of(context).pop();
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => Additem(
                  //           projectName:
                  //           widget.projectName.toString(),
                  //         )));
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
        Container(
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
                height: MediaQuery.of(context).size.height *
                    0.17125, //137
                width:
                MediaQuery.of(context).size.width * 0.44444, //160
                //margin: const EdgeInsets.only(left: 20, right: 20),
                child: InkWell(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    elevation: 10.0,
                    child: Stack(
                      children: [
                        // Positioned(
                        //   //top: 20,
                        //   //left: MediaQuery.of(context).size.height*(0.1895834),//0.17125 - 0.0416666 + 0.060),
                        //   child: Image.asset('assets/images/inventory_logo.png'),
                        // ),

                        Padding(
                          padding:
                          const EdgeInsets.only(top: 10, right: 10),
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
                            temp[index]["item_name"]
                                .toString(),
                            style: const TextStyle(
                                fontSize: 20,
                                fontFamily: 'ReadexPro'),
                          ),
                        ),
                        Positioned(
                          top: 60,
                          left: 20,
                          child: Text(
                            temp[index]["item_code"]
                                .toString(),
                            style: const TextStyle(
                                fontSize: 15,
                                fontFamily: 'ReadexPro'),
                          ),
                        ),
                        // Positioned(
                        //   top: MediaQuery.of(context).size.height *
                        //           0.107525 +
                        //       40,
                        //   left: MediaQuery.of(context).size.width *
                        //       0.086111,
                        //   child: const Text(
                        //     "Used - \nTotal -",
                        //     style: TextStyle(
                        //         fontSize: 13,
                        //         fontFamily: 'Inter',
                        //         color: Colors.black),
                        //   ),
                        // ),

                        const Padding(padding: EdgeInsets.only(left: 20,bottom: 15),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Used - \nTotal -",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: 'Inter',
                                  color: Colors.black),
                            ),
                          ),),


                      ],
                    ),
                  ),
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => ItemDetailPage(
                    //             proj : widget.projectName.toString(),
                    //             cont: widget.snapshot[index]["item_name"]
                    //                 .toString(),code : widget.snapshot[index]["item_code"]
                    //             .toString())));
                  },
                ),
                // child : Card(child: Center(child: Text(userList1[index].keys.elementAt(0).toString())))
              );
            },
          ),
        ),
      ],
    );
  }
}
