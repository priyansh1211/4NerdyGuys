import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TargetVsAchieved extends StatefulWidget {
  const TargetVsAchieved({Key? key}) : super(key: key);

  @override
  State<TargetVsAchieved> createState() => _TargetVsAchievedState();
}

class _TargetVsAchievedState extends State<TargetVsAchieved> {
  // File? image;
  // Future pickImage() async{
  //  try{
  //    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //    if (image==null) return;
  //
  //    final imageTemporary = File(image.path);
  //    setState(()=>this.image = imageTemporary);
  //  }on PlatformException catch (e) {
  //    print('Failed to pick image: $e');
  //  }
  // }
  File? _image;

  Future getImagefromCamera() async{

    var image = await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      _image = image as File?;
    });
  }
  Future getImagefromGallery() async{

    var image = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image as File?;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey.shade400,
        title: const Text(
          "Target Vs Achieved:",
          style: TextStyle(color: Colors.black),
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
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.only(left: 20),
              height: 50,
              margin: const EdgeInsets.only(right: 160),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child:  const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.keyboard_arrow_down_rounded),
                  hintText: 'Add Data',
                ),
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                        text: 'Description(Location)',
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                    WidgetSpan(
                        child: SizedBox(
                      width: MediaQuery.of(context).devicePixelRatio,
                    )),
                    const WidgetSpan(child: Icon(Icons.more_horiz)),
                    // TextSpan(text: 'to add'),
                  ],
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.only(left: 20),
              height: 50,
              margin: const EdgeInsets.only(right: 100),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child:const TextField(
                decoration: InputDecoration(
                  hintText: '-Give Work Description-',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                        text: 'Status',
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                    WidgetSpan(
                        child: SizedBox(
                      width: MediaQuery.of(context).devicePixelRatio,
                    )),
                    const WidgetSpan(child: Icon(Icons.more_horiz)),
                    // TextSpan(text: 'to add'),
                  ],
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.only(left: 20),
              height: 50,
              margin: const EdgeInsets.only(right: 100),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child:  const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  //prefixIcon: Icon(Icons)
                ),
              ),
            ),
          ),
          //SizedBox(height: 10,),
          Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                        text: 'Concrete Used',
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                    WidgetSpan(
                        child: SizedBox(
                      width: MediaQuery.of(context).devicePixelRatio,
                    )),
                    const WidgetSpan(child: Icon(Icons.more_horiz)),
                    // TextSpan(text: 'to add'),
                  ],
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.only(left: 20),
              height: 55,
              margin: const EdgeInsets.only(right: 100),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child:  const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          //SizedBox(height: 10,),
          Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                        text: 'Reason if not achieved',
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                    WidgetSpan(
                        child: SizedBox(
                      width: MediaQuery.of(context).devicePixelRatio,
                    )),
                    const WidgetSpan(child: Icon(Icons.more_horiz)),
                    // TextSpan(text: 'to add'),
                  ],
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.only(left: 20),
              height: 55,
              margin: const EdgeInsets.only(right: 100),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child:  const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          //SizedBox(height: 10,),
          Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                        text: 'Remarks',
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                    WidgetSpan(
                        child: SizedBox(
                      width: MediaQuery.of(context).devicePixelRatio,
                    )),
                    const WidgetSpan(child: Icon(Icons.more_horiz)),
                    // TextSpan(text: 'to add'),
                  ],
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.only(left: 20),
              height: 50,
              margin: const EdgeInsets.only(right: 100),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  // prefixIcon: Icon(Icons.mode_comment_outlined),
                ),
              ),
            ),
          ),
          // buildButton(
          //   title: "Pick from Gallery",
          //   icon: Icons.image_outlined,
          //   onClicked:(){} =>pickImage(),
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // buildButton(
          //   title: "Pick from Camera",
          //   icon:Icons.camera_alt_outlined,
          //   onClicked:(){},
          // ),
          GestureDetector(
            onTap: getImagefromCamera,
            child: _image == null ? Container(decoration: BoxDecoration(color: Colors.red[50],border: Border.all(color: Colors.red.shade200, width: 1.0),borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  children: <Widget>[
                    SizedBox(height:30.0),
                    Icon(Icons.camera_alt, color: Colors.red),
                    SizedBox(height: 10.0),
                    Text('Take Image of the Item', style: TextStyle(color: Colors.red)),
                    SizedBox(height: 30.0)
                  ],
                )) : Image.file(_image!),
          ),
          GestureDetector(
            onTap: getImagefromGallery,
            child: _image == null ? Container(decoration: BoxDecoration(color: Colors.red[50],border: Border.all(color: Colors.red.shade200, width: 1.0),borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  children: <Widget>[
                    SizedBox(height:30.0,width: 20),
                    Icon(Icons.camera_alt, color: Colors.red),
                    SizedBox(height: 10.0),
                    Text('Choose image from gallery', style: TextStyle(color: Colors.red)),
                    SizedBox(height: 30.0)
                  ],
                )) : Image.file(_image!),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.defaultDialog(
                      title: "Report has been created!",
                      middleText: "Do you want to download?",
                      titleStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'ReadexPro',
                        fontSize: 15),
                    middleTextStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'ReadexPro',
                          fontSize: 15),
                      textCancel: "NO",
                      cancelTextColor: Colors.white,
                      textConfirm: "YES",
                      confirmTextColor: Colors.white,
                      onConfirm: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const TargetVsAchieved()));
                      },
                      radius: 30,
                      buttonColor: const Color(0xff009AFF),
                      // barrierDismissible: false,
                      backgroundColor: const Color(0xff009AFF),
                    );
                }, child: const Text(
                  "Download",
                  // style: TextStyle(
                  //     color: Colors.white,
                  //     fontWeight: FontWeight.bold,
                  //     fontFamily: 'ReadexPro',
                  //     fontSize: 15),
                ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    // Widget buildButton({
    //   required String title,
    //   required IconData icon,
    //   required VoidCallback onClicked,
    // })=>
    //     ElevatedButton(
    //     style: ElevatedButton.styleFrom(
    //       minimumSize: Size.fromHeight(56),
    //       primary: Colors.white,
    //       onPrimary: Colors.black,
    //       textStyle: TextStyle(fontSize: 20),
    //     ),
    //     child: Row(
    //       children: [
    //         Icon(icon,size: 28,),
    //         const SizedBox(width: 16),
    //         Text(title),
    //       ],
    //     ));
  }
}

