import 'package:flutter/material.dart';
import 'package:flutter_app/pages/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Server (Back End)/network_handler.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String b = "";
  String email = "";

  NetworkHandler p = NetworkHandler();

  Future<void> logout() async {
    SharedPreferences? preferences = await SharedPreferences.getInstance();
    preferences.setBool('login', true);
  }

  void handleClick(String value) {
    switch (value) {
      case 'Edit':
        break;

      case 'Logout':
        logout();
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
        break;
    }
  }

  @override
  void initState() {
    initial().then(updateName);
    super.initState();
  }

  Future<String> initial() async {
    SharedPreferences? preferences = await SharedPreferences.getInstance();
    email = preferences.getString("Email")!;
    return email;
  }

  void updateName(String email) {
    setState(() {
      this.email = email;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List>(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.hasData) {
          return Scaffold(
            backgroundColor: const Color(0xff91DEF2),
            body: Stack(
              children: [
                Positioned(
                    left: MediaQuery.of(context).size.width * 0.04444,
                    top: MediaQuery.of(context).size.height * 0.0325,
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
                  right: MediaQuery.of(context).size.width * 0.02222,
                  top: MediaQuery.of(context).size.height * 0.0225,
                  child: PopupMenuButton<String>(
                    color: const Color(0xff91DEF2),
                    icon: const Icon(
                      Icons.more_vert,
                      size: 30,
                    ),
                    onSelected: handleClick,
                    itemBuilder: (BuildContext context) {
                      return {'Edit', 'Logout'}.map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(
                            choice,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black38),
                          ),
                        );
                      }).toList();
                    },
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.07,
                  left: MediaQuery.of(context).size.width * 0.17222,
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
                    top: MediaQuery.of(context).size.height * 0.1125,
                    left: MediaQuery.of(context).size.width * 0.45555,
                    child: Text(
                      snapshot.data![0]["username"],
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                Positioned(
                    top: MediaQuery.of(context).size.height * 0.145,
                    left: MediaQuery.of(context).size.width * 0.45555,
                    child: Text(
                      snapshot.data![0]["designation"],
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black38),
                    )),
                Positioned(
                    top: MediaQuery.of(context).size.height * 0.26375,
                    left: MediaQuery.of(context).size.width * 0.141666,
                    child: Row(
                      children: const [
                        Text(
                          "Reports made : ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "1000",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black38),
                        )
                      ],
                    )),
                Theme(
                  data: Theme.of(context).copyWith(
                    androidOverscrollIndicator:
                        AndroidOverscrollIndicator.values[0],
                  ),
                  child: DraggableScrollableSheet(
                      initialChildSize: 0.65,
                      minChildSize: 0.65,
                      maxChildSize: 0.8,
                      builder: (context, scrollController) {
                        return SingleChildScrollView(
                          controller: scrollController,
                          child: Container(
                            // margin: EdgeInsets.only(
                            //     top: MediaQuery.of(context).size.height * 0.3575),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(69),
                                  topRight: Radius.circular(69)),
                              border: Border.all(
                                  color: const Color(0xffD9D9D9), width: 7),
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.06625,
                                    left: MediaQuery.of(context).size.width *
                                        0.13888,
                                  ),
                                  child: const Text("Permitted Sites",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23)),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.1275,
                                    left: MediaQuery.of(context).size.width *
                                            0.13888 -
                                        20,
                                    right: MediaQuery.of(context).size.width *
                                            0.13888 -
                                        20,
                                  ),
                                  child: ListView.builder(
                                      itemCount: snapshot
                                          .data![0]["permitted_site"].length,
                                      itemBuilder: (context, j) {
                                        b = snapshot.data![0]["email"]
                                            .toString();
                                        List<dynamic> m = snapshot
                                            .data![0]["permitted_site"].values
                                            .elementAt(j) as List<dynamic>;
                                        String a = "";
                                        for (var element in m) {
                                          a += element + " ";
                                        }
                                        return Row(
                                          children: [
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                snapshot
                                                    .data![0]["permitted_site"]
                                                    .keys
                                                    .elementAt(j)
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 23,
                                                    color: Colors.black38),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 50,
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child: Text(
                                                  a,
                                                  overflow:
                                                      TextOverflow.visible,
                                                  style: const TextStyle(
                                                      fontSize: 23,
                                                      color: Colors.black38),
                                                )),
                                          ],
                                        );
                                      }),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          );
        }

        return const Text("Something Went Wrong");
      },
      stream: p.getUserdata({"email": email.toString()}),
    );
  }
}
