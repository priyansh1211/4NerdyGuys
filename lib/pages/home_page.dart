import 'package:flutter/material.dart';
import 'package:flutter_app/Server%20(Back%20End)/network_handler.dart';
import 'package:flutter_app/pages/ActiveEmployees.dart';
import 'package:flutter_app/pages/Contact-Us/Contact_Us.dart';
import 'package:flutter_app/pages/Dashboard/DashboardPage.dart';
import 'package:flutter_app/pages/Project/Project.dart';
import 'package:flutter_app/pages/drawerpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  String name = "";
  
  NetworkHandler p = NetworkHandler();

  @override
  void initState() {
    initial().then(updateName);
    super.initState();
  }


  Future <String> initial() async {
    SharedPreferences? preferences = await SharedPreferences.getInstance();
    name = preferences.getString("UserName")!;
    return name;
  }

  void updateName(String name) {
    setState(() {
      this.name = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
        endDrawer: const DrawerPage(),
        body: Center(
            child: Stack(
                alignment: Alignment.center,
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
            left: MediaQuery.of(context).size.width*0.875,
            top: 35,
            child: Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                color: const Color(0xff000000),
                iconSize: 30,
              ),
            ),
          ),
          const Positioned(
           left: 30,
            top: 50,
            child: Text(
              "Home",
              style: TextStyle(fontSize: 30, fontFamily: 'ReadexPro'),
            ),
          ),
          Positioned(
            top: screensize.height * 0.32,
            left: (screensize.width * 0.5) - 35,
            child: CircleAvatar(
              radius: 35,
              backgroundColor: Colors.white,
              child: Center(
                child: Icon(
                  Icons.person,
                  size: 30,
                  color: Colors.blue[200],
                ),
              ),
            ),
          ),



          Positioned(
            top: screensize.height * 0.3675 + 37,
            //left: screensize.width * 0.5 - 40 - name.length,
            child:Text(
              name,
              style: const TextStyle(
                fontSize: 30,
                fontFamily: 'ReadexPro',
              ),
            ),
          ),
          // FutureBuilder(builder: (context,snapshot) {
          //   if(ConnectionState == ConnectionState.waiting)
          //     {
          //       return Container(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,color: Colors.white,child: const Center(child: CircularProgressIndicator(),),);
          //     }
          //   if(snapshot.hasData)
          //     {
          //       return Positioned(
          //           top: screensize.height * 0.3675 + 37,
          //           left: screensize.width * 0.5 - 40,// - name.length,
          //           child:Text(
          //             snapshot.data!.toString(),
          //             style: const TextStyle(
          //               fontSize: 30,
          //               fontFamily: 'ReadexPro',
          //             ),
          //           ),
          //         );
          //     }
          //     return const Text("Something Went Wrong");
          // },
          //   future: p.Username({"email" : email}),
          // ),

          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.45375 + 35),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              // crossAxisAlignment: CrossAxisAlignment.center,

              children: <Widget>[
                Row(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.44,
                        height: MediaQuery.of(context).size.height * 0.20125,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32.0),
                          color: const Color(0xffFFFFFF),
                        ),
                        margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.044,
                          right: MediaQuery.of(context).size.width * 0.011,
                          bottom: MediaQuery.of(context).size.width * 0.11,
                        ),
                        child: InkWell(
                          child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).size.height *
                                        0.07095),
                                child: Center(
                                  child: Image.asset('assets/images/proj.png'),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 10.42),
                                  width: MediaQuery.of(context).size.width *
                                      0.3653055555555556,
                                  height: MediaQuery.of(context).size.height *
                                      0.0419875,
                                  decoration: BoxDecoration(
                                      color: const Color(0xffE4FBFF),
                                      borderRadius:
                                          BorderRadius.circular(32.0)),
                                  child: const Center(
                                    child: Text("Project",
                                        style: TextStyle(
                                            fontFamily: 'ReadexPro',
                                            fontSize: 15)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ProjectPage()));
                          },
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.44,
                        height: MediaQuery.of(context).size.height * 0.20125,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32.0),
                          color: const Color(0xffFFFFFF),
                        ),
                        margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.011,
                          right: MediaQuery.of(context).size.width * 0.044,
                          bottom: MediaQuery.of(context).size.width * 0.11,
                        ),
                        child: InkWell(
                          child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).size.height *
                                        0.07095),
                                child: Center(
                                  child: Image.asset('assets/images/dash.png'),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 10.42),
                                  width: MediaQuery.of(context).size.width *
                                      0.3653055555555556,
                                  height: MediaQuery.of(context).size.height *
                                      0.0419875,
                                  decoration: BoxDecoration(
                                      color: const Color(0xffE4FBFF),
                                      borderRadius:
                                          BorderRadius.circular(32.0)),
                                  child: const Center(
                                    child: Text("Dashboard",
                                        style: TextStyle(
                                            fontFamily: 'ReadexPro',
                                            fontSize: 15)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const DashboardPage()));
                          },
                        )),
                  ],
                ),

                Row(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.44,
                        height: MediaQuery.of(context).size.height * 0.20125,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32.0),
                          color: const Color(0xffFFFFFF),
                        ),
                        margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.044,
                          right: MediaQuery.of(context).size.width * 0.011,
                        ),
                        child: InkWell(
                          child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).size.height *
                                        0.07095),
                                child: Center(
                                  child:
                                      Image.asset('assets/images/profile.png'),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 10.42),
                                  width: MediaQuery.of(context).size.width *
                                      0.3653055555555556,
                                  height: MediaQuery.of(context).size.height *
                                      0.0419875,
                                  decoration: BoxDecoration(
                                      color: const Color(0xffE4FBFF),
                                      borderRadius:
                                          BorderRadius.circular(32.0)),
                                  child: const Center(
                                    child: Text("Employees",
                                        style: TextStyle(
                                            fontFamily: 'ReadexPro',
                                            fontSize: 15)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ActiveEmployees()));
                          },
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.44,
                        height: MediaQuery.of(context).size.height * 0.20125,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32.0),
                          color: const Color(0xffFFFFFF),
                        ),
                        margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.011,
                          right: MediaQuery.of(context).size.width * 0.044,
                        ),
                        child: InkWell(
                          child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).size.height *
                                        0.07095),
                                child: Center(
                                  child: Image.asset(
                                      'assets/images/contact_us.png'),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 10.42),
                                  width: MediaQuery.of(context).size.width *
                                      0.3653055555555556,
                                  height: MediaQuery.of(context).size.height *
                                      0.0419875,
                                  decoration: BoxDecoration(
                                      color: const Color(0xffE4FBFF),
                                      borderRadius:
                                          BorderRadius.circular(32.0)),
                                  child: const Center(
                                    child: Text("Contact US",
                                        style: TextStyle(
                                            fontFamily: 'ReadexPro',
                                            fontSize: 15)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ContactPage()));
                          },
                        )),
                  ],
                ),

                // Positioned(
                //   top: screensize.height* 0.3675,
                //   left: screensize.width * 0.41,
                //   child: Text(
                //     "VISHWAS",
                //     style: TextStyle(
                //       fontSize: 30,
                //       fontFamily: 'ReadexPro',
                //     ),
                //   ),
                // ),

                // Align(
                //   alignment:  Alignment(0, screensize.height*-0.00048),
                //   child: CircleAvatar(
                //     radius: 35,
                //     backgroundColor: Colors.white,
                //     child: Center(
                //       child: Icon(
                //         Icons.person,
                //         size: 30,
                //         color: Colors.blue[200],
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ] //debugShowCheckedModeBanner: false,
                )));
  }
}
