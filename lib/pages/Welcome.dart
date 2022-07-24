import 'package:flutter/material.dart';
import 'package:flutter_app/pages/LoginPage.dart';
class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 170, top: 50),
                child: Text(
                  'Welcome',
                  style: TextStyle(fontFamily: 'ReadexPro', fontSize: 32),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 40, top: 40),
                child: const ClipRRect(
                  //borderRadius: BorderRadius.circular(0),
                  child: Image(
                      image: AssetImage('assets/images/welcome.png'),
                      height: 243,
                      width: 318,
                      fit: BoxFit.fitHeight),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'User type',
                  style: TextStyle(
                      fontFamily: 'ReadexPro',
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 InkWell(
                   child:Container(
                     decoration: BoxDecoration(
                       color: Color(0xffC3D3FD),
                       borderRadius: BorderRadius.circular(25),
                     ),
                     height: 149,
                     width: 142,
                     child: Stack(
                       children: [
                         Card(
                           color: const Color(0xffC3D3FD),
                           shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(50.0)),
                           //elevation: 50.0,
                           margin: EdgeInsets.only(bottom: 59,left: 22),
                           child: Image.asset('assets/images/employee.png'),
                         ),
                         Align(
                           alignment: Alignment.bottomCenter,
                           child: Container(
                             margin: EdgeInsets.only(bottom: 9,right: 9,left: 9),
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(20),
                               color: Colors.white,
                             ),
                             height: 29,
                             width: 120,
                             child: Center(
                               child: Text('Employee',style: TextStyle(fontFamily: 'ReadexPro'),),
                             ),
                           ),
                         ),
                       ],
                     ),
                   ), 
                   onTap: ()
                   {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                   },
                 ),
                  InkWell(
                    child:Container(
                      decoration: BoxDecoration(
                        color: Color(0xffC3D3FD),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      height: 149,
                      width: 142,
                      child: Stack(
                        children: [
                          Card(
                            color: const Color(0xffC3D3FD),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0)),
                            //elevation: 50.0,
                            margin: EdgeInsets.only(bottom: 30,left: 25,top: 10),
                            child: Image.asset('assets/images/owner.png'),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin: EdgeInsets.only(bottom: 9,right: 9,left: 9),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              height: 29,
                              width: 120,
                              child: Center(
                                child: Text('Owner',style: TextStyle(fontFamily: 'ReadexPro'),),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                    },
                  ),
                 //  InkWell(
                 //    child: Card(
                 //      color: const Color(0xffC3D3FD),
                 //      shape: RoundedRectangleBorder(
                 //          borderRadius: BorderRadius.circular(30.0)),
                 //      //elevation: 50.0,
                 //      margin: const EdgeInsets.all(20),
                 //      child: Image.asset('assets/images/owner.png'),
                 //    ),
                 //    onTap: () {
                 //      Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginPage()));
                 //    },
                 //  ),
                ], //mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
