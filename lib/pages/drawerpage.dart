import 'package:flutter/material.dart';
import 'package:flutter_app/pages/Contact_Us.dart';
import 'package:flutter_app/pages/DashboardPage.dart';
import 'package:flutter_app/pages/LoginPage.dart';
import 'package:flutter_app/pages/Project.dart';

class DrawerPage extends StatefulWidget {
  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xffA6D1E6),
      child: ListView(
        children: [
          ListTile(
            leading:
                Icon(Icons.arrow_back_ios, color: Color(0xff000000), size: 28),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: Align(
                alignment: Alignment.centerRight,
                child: Text('Vishwas',
                    style: TextStyle(fontSize:20, fontFamily: 'Readxpro'))),
            trailing: CircleAvatar(
              radius: 25,
              backgroundColor: Color(0xffFFFFFF),
              child: Center(
                  child:
                      Icon(Icons.person, size: 30, color: Color(0xff6495ED))),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Color(0xff000000), size: 28),
            title: Text('Projects',
                style: TextStyle(
                    color: Color(0xff635E5E),
                    fontFamily: 'Opensans',
                    fontSize: 18)),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProjectPage()));
              print('go to project');
            },
          ),
          ListTile(
            leading: Icon(Icons.train, color: Color(0xff000000), size: 28),
            title: Text('Dashboard',
                style: TextStyle(
                    color: Color(0xff635E5E),
                    fontFamily: 'Opensans',
                    fontSize: 18)),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DashboardPage()));
              //print('go to Dashboard page');
            },
          ),
          ListTile(
            leading: Icon(Icons.person, size: 28, color: Color(0xff000000)),
            title: Text('Profile',
                style: TextStyle(
                    color: Color(0xff635E5E),
                    fontFamily: 'Opensans',
                    fontSize: 18)),
            onTap: () {
              print('go to profile');
            },
          ),
          ListTile(
            leading:
                Icon(Icons.account_circle, size: 28, color: Color(0xff000000)),
            title: Text('Contact us',
                style: TextStyle(
                    color: Color(0xff635E5E),
                    fontSize: 18,
                    fontFamily: 'Opensans')),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ContactPage()));
            },
          ),
          Container(
            margin: EdgeInsets.only(top: 300, left: 150),
            child: InkWell(
                child: Text('Log out', style: TextStyle(fontSize: 18)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                }),
          ),
        ],
      ),
    );
  }
}
