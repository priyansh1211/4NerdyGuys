import 'package:flutter/material.dart';
import 'package:flutter_app/Server%20(Back%20End)/network_handler.dart';
import 'package:flutter_app/pages/Project/Project.dart';

class AddProjectPage extends StatefulWidget {
  const AddProjectPage({Key? key}) : super(key: key);

  @override
  State<AddProjectPage> createState() => _AddProjectPageState();
}

class _AddProjectPageState extends State<AddProjectPage> {
  TextEditingController projectname = TextEditingController();
  TextEditingController floors = TextEditingController();
  TextEditingController blocks = TextEditingController();

  NetworkHandler p = NetworkHandler();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color(0xffE5E5E5),
          ),
          const Positioned(
            top: 35,
            left: 50,
            child: Text('Add Project',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          ),
          ListView(
            children: [
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.345,
                    width: MediaQuery.of(context).size.width * 0.9111,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.10875,
                        left: MediaQuery.of(context).size.width * 0.04444,
                        right: MediaQuery.of(context).size.width * 0.04444),
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.055,
                        left: 30,
                        right: 30,
                        bottom: MediaQuery.of(context).size.height * 0.03625),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color(0xff89CFFD),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text('Add New Project Name',
                              style: TextStyle(fontSize: 16)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Flexible(
                          child: TextFormField(
                            controller: projectname,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  borderSide: BorderSide(color: Colors.white)),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter Project Name ";
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text('Add no. of floors',
                              style: TextStyle(fontSize: 16)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Flexible(
                          child: TextFormField(
                            controller: floors,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  borderSide: BorderSide(color: Colors.white)),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter Something";
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text('Add no. of block',
                              style: TextStyle(fontSize: 16)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Flexible(
                          child: TextFormField(
                            controller: blocks,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  borderSide: BorderSide(color: Colors.white)),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter Something";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.075,
                  ),
                  Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        width: 86,
                        height: 38,
                        child: FloatingActionButton(
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(3.1)),
                          backgroundColor: const Color(0xff6BC4FF),
                          onPressed: () async {
                            bool? response = await p.addProject({
                              "project_name": projectname.text,
                              "floors": floors.text,
                              "blocks": blocks.text
                            });

                            if (response == true) {
                              Navigator.of(context).pop();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ProjectPage()));
                            }
                          },
                          child: const Text("Add"),
                        ),
                      )),
                ],
              ),
            ],
          ),
          Positioned(
              left: 20,
              top: 35,
              child: InkWell(
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProjectPage()));
                },
              )),
        ],
      ),
    );
  }
}
