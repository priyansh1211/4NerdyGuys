import 'dart:convert';
import 'dart:io';

//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TargetVsAchieved extends StatefulWidget {
  const TargetVsAchieved({Key? key}) : super(key: key);

  @override
  State<TargetVsAchieved> createState() => _TargetVsAchievedState();
}

class _TargetVsAchievedState extends State<TargetVsAchieved> {

  List<String> column_name =['Remarks'];
  int number = 1;
  final fkey = GlobalKey<FormState>();
  TextEditingController message = TextEditingController();

  File? selectedImageFromCamera;
  File? selectedImageFromGallery;
  String base64Image = "";

  Future<void> chooseImage(type) async {
    // ignore: prefer_typing_uninitialized_variables
    var imageFromCamera;
    var imageFromGallery;
    if (type == "camera") {
      imageFromCamera = await ImagePicker().pickImage(
        source: ImageSource.camera,
      );
    }
    if(type=="gallery") {
      imageFromGallery = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
    }
    if (imageFromCamera != null) {
      setState(() {
        selectedImageFromCamera = File(imageFromCamera.path);
        base64Image = base64Encode(selectedImageFromCamera!.readAsBytesSync());
        // won't have any error now
      });
      if(imageFromGallery!=null)
        {
          setState((){
            selectedImageFromGallery=File(imageFromGallery.path);
            base64Image=base64Encode(selectedImageFromGallery!.readAsBytesSync());
          });
        }
    }
  }

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
  // File? _image;
  // _imageFromCamera() async {
  //   File image = (await ImagePicker().pickImage(
  //       source: ImageSource.camera)) as File;
  //   setState(() {
  //     _image = image;
  //   });
  // }
  //   _imageFromGallery() async{
  //     File image = (await ImagePicker().pickImage(source: ImageSource.gallery)) as File;
  //     setState((){
  //       _image = image;
  //     });
  //   }
  // void _PickImageFromCamera(context){
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (BuildContext bc){
  //     return GestureDetector(
  //       onTap: (){
  //         _imageFromCamera();
  //         Navigator.of(context).pop();
  //       },
  //       child: const Icon(Icons.camera_alt),
  //     );
  //   });
  // }
  // void _PickImageFromGallery(context){
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (BuildContext bc){
  //         return GestureDetector(
  //           onTap: (){
  //             _imageFromGallery();
  //             Navigator.of(context).pop();
  //           },
  //           child: const Icon(Icons.photo_library_outlined),
  //         );
  //       });
  // }
  @override
  Widget build(BuildContext context) {
  //  var screensize = MediaQuery.of(context).size;
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            OutlinedButton(
                onPressed: () {
                  {
                    showDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0))),
                            content: Form(
                                key: fkey,
                                child: SizedBox(
                                  width: 100,
                                  height: 200,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        decoration: const InputDecoration(
                                            labelText: 'Enter Column Name'),
                                        controller: message,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Enter Something";
                                          }
                                          return null;
                                        },
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top: 20),
                                            child: ElevatedButton(
                                              onPressed: () {
                                                if (fkey.currentState!.validate()) {
                                                  column_name.add(message.text);
                                                  Navigator.pop(context);
                                                  message.clear();
                                                  setState(() {
                                                    number = number + 1;
                                                  });
                                                }
                                              },
                                              child: const Text('Add'),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 20),
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Cancel'),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                          );
                        });
                  }
                },
                child: const Text("Add a column")),
            SizedBox(height: 20,),
            Padding(
                padding: const EdgeInsets.only(right: 60),
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
                padding: const EdgeInsets.only(right: 200),
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
                padding: const EdgeInsets.only(right: 130),
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
                padding: const EdgeInsets.only(right: 65),
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
            // GestureDetector(
            //   onTap: (){
            //     _PickImageFromCamera(context);
            //   },
            //   child: CircleAvatar(
            //     radius: 55,
            //     backgroundColor: Colors.black,
            //     child: _image!=null
            //         ?ClipRRect(
            //       borderRadius: BorderRadius.circular(50),
            //       child: Image.file(
            //         _image!,
            //         height: 100,
            //         fit: BoxFit.fitHeight,
            //         width: 100,
            //       ),
            //     ):Container(
            //       decoration: BoxDecoration(
            //           color: Colors.grey.shade200,
            //           borderRadius: BorderRadius.circular(50)
            //       ),
            //       width: 100,
            //       height: 100,
            //       child: Icon(
            //         Icons.camera_alt,
            //         color: Colors.grey.shade800,
            //       ),
            //     ),
            //   ),
            // ),
            //  GestureDetector(
            //    onTap: (){
            //      _PickImageFromGallery(context);
            //    },
            //    child: CircleAvatar(
            //      radius: 55,
            //      backgroundColor: Colors.black,
            //      child: _image!=null
            //      ?ClipRRect(
            //        borderRadius: BorderRadius.circular(50),
            //        child: Image.file(
            //          _image!,
            //          height: 100,
            //          fit: BoxFit.fitHeight,
            //          width: 100,
            //        ),
            //      ):Container(
            //        decoration: BoxDecoration(
            //          color: Colors.grey.shade200,
            //          borderRadius: BorderRadius.circular(50)
            //        ),
            //        width: 100,
            // const height: 100,
            //        child: Icon(
            //          Icons.photo_library_outlined,
            //          color: Colors.grey.shade800,
            //        ),
            //      ),
            //    ),
            //  ),
            //SizedBox(height: 10,),
            // Padding(
            //     padding: const EdgeInsets.only(right: 190),
            //     child: Text.rich(
            //       TextSpan(
            //         children: [
            //           const TextSpan(
            //               text: 'Remarks',
            //               style: TextStyle(
            //                   color: Colors.black, fontSize: 20)),
            //           WidgetSpan(
            //               child: SizedBox(
            //                 width:
            //                 MediaQuery.of(context).devicePixelRatio,
            //               )),
            //           const WidgetSpan(child: Icon(Icons.more_horiz)),
            //           // TextSpan(text: 'to add'),
            //         ],
            //       ),
            //     )),
            // Padding(
            //   padding: const EdgeInsets.all(20),
            //   child: Container(
            //     padding: const EdgeInsets.only(left: 12),
            //     height: 50,
            //     margin: const EdgeInsets.only(right: 100),
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(20),
            //     ),
            //     child: const TextField(
            //       decoration: InputDecoration(
            //         border: InputBorder.none,
            //       ),
            //     ),
            //   ),
            // ),
            ListView.builder(
              physics: const ScrollPhysics(parent: null),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int i) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(right: 190),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text:column_name[i].toString(),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20)),
                                WidgetSpan(
                                    child: SizedBox(
                                      width:
                                      MediaQuery.of(context).devicePixelRatio,
                                    )),
                                const WidgetSpan(child: Icon(Icons.more_horiz)),
                                // TextSpan(text: 'to add'),
                              ],
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          padding: const EdgeInsets.only(left: 12),
                          height: 50,
                          margin: const EdgeInsets.only(right: 100),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: number,

            ),
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.red,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                // Border radius
                child: ClipOval(
                    child: selectedImageFromCamera != null
                        ? Image.file(
                      selectedImageFromCamera!,
                      fit: BoxFit.cover,
                      height: 100,
                      width: 100,
                    )
                        : Image.network(
                      'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
                      fit: BoxFit.cover,
                      height: 100,
                      width: 100,
                    )),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                chooseImage("camera");
              },
              child: const Text("Target Image from camera"),
            ),
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(8), // Border radius
                child: ClipOval(
                    child: selectedImageFromGallery != null
                        ? Image.file(
                      selectedImageFromGallery!,
                      fit: BoxFit.cover,
                      height: 100,
                      width: 100,
                    )
                        : Image.network(
                      'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
                      fit: BoxFit.cover,
                      height: 100,
                      width: 100,
                    )),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                chooseImage("gallery");
              },
              child: const Text("Achieved Image From Gallery"),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.defaultDialog(
                        middleText: "Do you want to continue?",
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
                        cancelTextColor: const Color(0xff685D5D),
                        textConfirm: "YES",
                        confirmTextColor: Colors.lightGreenAccent,
                        radius: 40,
                        buttonColor: const Color(0xff685D5D),
                        //barrierDismissible: false,
                        backgroundColor: const Color(0xff009AFF),
                        onConfirm: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const TargetVsAchieved()));
                        },
                      );
                    },
                    child: const Text(
                      "Make Report",
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

