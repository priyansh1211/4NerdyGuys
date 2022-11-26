import 'package:flutter/material.dart';
import 'package:flutter_app/pages/Contact_Us.dart';
import 'package:flutter_app/pages/DashboardPage.dart';
import 'package:flutter_app/pages/LoginPage.dart';
import 'package:flutter_app/pages/Project.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {

  late SharedPreferences logindata;

  @override
  void initState() {

    super.initState();
    initial();
  }

  void initial() async{
    logindata = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xffA6D1E6),
      child: ListView(
        children: [
          ListTile(
            leading:
                const Icon(Icons.arrow_back_ios, color: Color(0xff000000), size: 28),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          const ListTile(
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
            leading: const Icon(Icons.home, color: Color(0xff000000), size: 28),
            title: const Text('Projects',
                style: TextStyle(
                    color: Color(0xff635E5E),
                    fontFamily: 'Opensans',
                    fontSize: 18)),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ProjectPage()));
              print('go to project');
            },
          ),
          ListTile(
            leading: const Icon(Icons.train, color: Color(0xff000000), size: 28),
            title: const Text('Dashboard',
                style: TextStyle(
                    color: Color(0xff635E5E),
                    fontFamily: 'Opensans',
                    fontSize: 18)),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const DashboardPage()));
              //print('go to Dashboard page');
            },
          ),
          ListTile(
            leading: const Icon(Icons.person, size: 28, color: Color(0xff000000)),
            title: const Text('Profile',
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
                const Icon(Icons.account_circle, size: 28, color: Color(0xff000000)),
            title: const Text('Contact us',
                style: TextStyle(
                    color: Color(0xff635E5E),
                    fontSize: 18,
                    fontFamily: 'Opensans')),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ContactPage()));
            },
          ),
          Container(
            margin: const EdgeInsets.only(top: 300, left: 150),
            child: InkWell(
                child: const Text('Log out', style: TextStyle(fontSize: 18)),
                onTap: () {

                  logindata.setBool("login", true);

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LoginPage()));
                }),
          ),
        ],
      ),
    );
  }
}
