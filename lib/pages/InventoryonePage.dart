import 'package:flutter/material.dart';
import 'package:flutter_app/pages/Item_list.dart';
import 'package:flutter_app/pages/drawerpage.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({Key? key}) : super(key: key);
  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {

  List userList1 = ['Sanskruti', 'Antriksh' , 'Nakshtra','Shruti'];

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: DrawerPage(),
      body: Center(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xffE5E5E5),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/images/bgimage.png',
                width: screensize.width,
                height: screensize.height * 0.36,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 330,
              top: 46,
              child: Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.menu),
                  iconSize: 30,
                  color: Color(0xff000000),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                  tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                ),
              ),
            ),
            Positioned(
              left: 30,
              top: 46,
              child: InkWell(
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  }),
            ),
            const Positioned(
              left: 30,
              top: 100,
              child: Text(
                "Inventory",
                style: TextStyle(fontSize: 30, fontFamily: 'ReadexPro'),
              ),
            ),
            Container(
              width: screensize.width,
              margin: EdgeInsets.only(
                top: screensize.height * 0.38,
              ),

              child: ListView.builder(
                  itemCount: userList1.length,
                  itemBuilder: (context, i) {
                    return InkWell(child: Container(

                      margin: const EdgeInsets.only(bottom: 50,left: 20,right: 20),
                      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)),color: Color(0xffBDE6F1),),
                      child: Row(
                        children: [
                          Container(
                            width: screensize.width * 0.35,
                            height: screensize.height * 0.16,
                            margin: EdgeInsets.only(
                              left: screensize.width * 0.045,
                              top: screensize.height * 0.02,
                            ),
                            alignment: Alignment.center,
                            child: Center(
                              child: Column(
                                children:  [
                                  Text(
                                    userList1[i],
                                    style: const TextStyle(
                                        fontFamily: 'Readxpro', fontSize: 25),
                                  ),
                                  const Text(
                                    'Ongoing Site',
                                    style: TextStyle(
                                        fontFamily: 'Readxpro', fontSize: 15),
                                  ),
                                  const Text(
                                    '73%',
                                    style: TextStyle(
                                        fontFamily: 'Readxpro', fontSize: 30),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: screensize.width * 0.34,
                            height: screensize.height * 0.13,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(27.0),
                              color: const Color(0xffFFFFFF),
                            ),
                            margin: EdgeInsets.only(
                              left: screensize.width * 0.03,
                            ),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children: const <Widget>[
                                Text(
                                  'Tasks',
                                  style: TextStyle(
                                      fontFamily: 'Readxpro', fontSize: 23),
                                ),
                                Text(
                                  '46%',
                                  style: TextStyle(
                                      fontFamily: 'Readxpro', fontSize: 23),
                                ),
                              ],
                            ),
                          ),




                        ],
                      ),
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const ItemPage()));
                    },);

                  }),


            ),
          ],
        ),
      ),
    );
  }
}
