import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   appBar: AppBar(
      //     title: Text("Card"),
      //   ),
      drawer: const Drawer(
        child: DrawerHeader(
          child: Text("Hello World"),
        ),
      ),
      body: Center(
        child: Stack(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xffE5E5E5),
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'assets/images/bgimage.png',
                    height: 350,
                    width: 1700,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 30,
              top: 30,
              child: Text(
                "Home",
                style: TextStyle(fontSize: 30, fontFamily: 'ReadexPro'),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.white,
                    child: Center(
                      child: Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.blue[200],
                      ),
                    ),
                  ),
                ),
                const Center(
                  child: Text(
                    "Home",
                    style: TextStyle(fontSize: 30, fontFamily: 'ReadexPro',),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        //elevation: 50.0,
                        margin: const EdgeInsets.all(20),
                        child: Image.asset('assets/images/proj.png'),
                      ),
                      onTap: () {
                        print("Project");
                      },
                    ),
                    InkWell(
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        //elevation: 50.0,
                        margin: const EdgeInsets.all(20),
                        child: Image.asset('assets/images/dash.png'),
                      ),
                      onTap: () {
                        print("Dashboard");
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        //elevation: 50.0,
                        margin: const EdgeInsets.all(20),
                        child: Image.asset('assets/images/profile.png'),
                      ),
                      onTap: () {
                        print("Profile");
                      },
                    ),
                    InkWell(
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        //elevation: 50.0,
                        margin: const EdgeInsets.all(20),
                        child: Image.asset('assets/images/contact_us.png'),
                      ),
                      onTap: () {
                        print("Contact Us");
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),

//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Container(
//                   color: Colors.grey,
//                   height: 200,
//                   width: 200,
//                   child: Card(
//                     color: Colors.white,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30.0)
//                     ),
//                     //elevation: 50.0,
//                     margin: EdgeInsets.all(20),
//                   ),
//                 ),
//                 Container(
//                   color: Colors.grey,
//                   height: 200,
//                   width: 200,
//                   child: Card(
//                     color: Colors.white,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30.0)
//                     ),
//                    // elevation: 50.0,
//                     margin: EdgeInsets.all(20),
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Container(
//                   color: Colors.grey,
//                   height: 200,
//                   width: 200,
//                   child: Card(
//                     color: Colors.white,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30.0)
//                     ),
//                    // elevation: 50.0,
//                     margin: EdgeInsets.all(20),
//                   ),
//                 ),
//                 Container(
//                   color: Colors.grey,
//                   height: 200,
//                   width: 200,
//                   child: Card(
//                     color: Colors.white,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30.0)
//                     ),
//                    // elevation: 50.0,
//                     margin: EdgeInsets.all(20),
//                   ),
//                 ),
//               ],
//             )
//
//           ],
//         )
      ),
    );
  }
}