import 'package:flutter/material.dart';
import 'package:flutter_app/Server%20(Back%20End)/network_handler.dart';
import 'package:flutter_app/pages/ActiveEmployees.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

// ignore: must_be_immutable
class SecondProjectBlocks extends StatefulWidget {
  List<String> index;
  String projectName;
  String name;
  String email;
  String designation;

  SecondProjectBlocks(
      {Key? key,
      required this.index,
      required this.projectName,
      required this.email,
      required this.name,
      required this.designation})
      : super(key: key);

  @override
  State<SecondProjectBlocks> createState() => _SecondProjectBlocksState();
}

class _SecondProjectBlocksState extends State<SecondProjectBlocks> {
  String dropdownvalue1 = 'Select Blocks';
  List forApi = [];

  final fkey = GlobalKey<FormFieldState>();

  NetworkHandler p = NetworkHandler();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color(0xffE5E5E5),
          ),
          Positioned(
              left: 20,
              top: 15,
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
            top: MediaQuery.of(context).size.height * 0.1,
            left: 20,
            child: Text(
              widget.name,
              style: const TextStyle(fontSize: 30),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.145,
            left: 22,
            child: Text(widget.designation),
          ),
          Container(
            height: 60,
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.195,
                left: MediaQuery.of(context).size.width * 0.04444,
                right: MediaQuery.of(context).size.width * 0.04444),
            padding:
                const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xffAECAEC),
            ),
            child: Center(
              child: Text(
                widget.projectName,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.32,
                left: MediaQuery.of(context).size.width * 0.04444,
                right: MediaQuery.of(context).size.width * 0.04444,
                bottom: 50),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      top: 5, left: 5, right: 5, bottom: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color(0xffAECAEC),
                  ),
                  child: MultiSelectBottomSheetField(
                    key: fkey,
                    initialChildSize: 0.4,
                    listType: MultiSelectListType.CHIP,
                    searchable: true,
                    buttonText: const Text("Select Blocks"),
                    title: const Text("List Of Blocks"),
                    items:
                        widget.index.map((e) => MultiSelectItem(e, e)).toList(),
                    buttonIcon: const Icon(Icons.keyboard_arrow_down),
                    validator: (values) {
                      if (values == null || values.isEmpty) {
                        return "  Required";
                      }
                      return null;
                    },
                    onConfirm: (values) {
                      if (forApi.isEmpty) {
                        for (var element in values) {
                          if (!forApi.contains(element)) {
                            forApi.add(element);
                          }
                        }
                      }
                      if (forApi.isNotEmpty) {
                        forApi = [];
                        for (var element in values) {
                          if (!forApi.contains(element)) {
                            forApi.add(element);
                          }
                        }
                      }
                      //print(values);
                    },
                    chipDisplay: MultiSelectChipDisplay(
                      onTap: (value) {
                        setState(() {
                          widget.index.remove(value);
                          forApi.remove(value);
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () async {
                    //List m = () as List;
                    if (fkey.currentState!.validate()) {
                      Map<String, dynamic> m = await p
                          .listtoSave({"email": widget.email.toString()});

                      bool notInMap = true;
                      //print(m.keys.toString() == "none");
                      if (m.keys.elementAt(0) == "none" &&
                          m.values.elementAt(0) == "none") {
                        m.clear();
                      }

                      for (int i = 0; i < m.keys.length; i++) {
                        if (m.keys.elementAt(i).toString() ==
                            widget.projectName.toString()) {
                          notInMap = false;
                          for (var element in m.values.elementAt(i)) {
                            if (!forApi.contains(element)) {
                              forApi.add(element.toString());
                            }
                          }
                        }
                      }
                      forApi.sort();
                      //print("========> ${m}");

                      if (!notInMap) {
                        m.update(
                            widget.projectName.toString(), (value) => forApi);
                      }

                      if (notInMap) {
                        m[widget.projectName] = forApi;
                      }
                      //
                      // // print(widget.email);
                      //print("========> ${m}");

                      p.updateActiveEmployees({
                        "email": widget.email.toString(),
                        "permitted_site": m
                      });
                      //ignore: use_build_context_synchronously
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const ActiveEmployees()));
                    }
                  },
                  style: const ButtonStyle(
                      elevation: MaterialStatePropertyAll(10),
                      backgroundColor: MaterialStatePropertyAll(
                        Color(0xffAECAEC),
                      ),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(21))))),
                  child: Container(
                    height: 56,
                    width: 126,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                    ),
                    child: const Center(
                      child: Text(
                        "Save",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
