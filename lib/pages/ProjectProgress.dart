import 'package:flutter/material.dart';
class ProjectProgress extends StatefulWidget {
  const ProjectProgress({Key? key}) : super(key: key);

  @override
  State<ProjectProgress> createState() => _ProjectProgressState();
}

class _ProjectProgressState extends State<ProjectProgress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xffE5E5E5),
        title: const Text(
          "Project Progress Review:",
          style: TextStyle(color: Colors.black,fontSize: 18),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
                onTap: () {},
                child: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 30,
                    color: Colors.blue,
                  ),
                )),
          ),
        ],
      ),

    );
  }
}
