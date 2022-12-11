import 'package:flutter_app/Server%20(Back%20End)/network_handler.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SecondProjectBlocks extends StatefulWidget {
  List<String> index;
  String projectName;
  String email;
  SecondProjectBlocks(
      {Key? key,
      required this.index,
      required this.projectName,
      required this.email})
      : super(key: key);

  @override
  State<SecondProjectBlocks> createState() => _SecondProjectBlocksState();
}

class _SecondProjectBlocksState extends State<SecondProjectBlocks> {
  String dropdownvalue1 = 'Select Blocks';
  List forApi = [];

  NetworkHandler p = NetworkHandler();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color(0xffE5E5E5),
          ),
          ListView(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.10875,
                        left: MediaQuery.of(context).size.width * 0.04444,
                        right: MediaQuery.of(context).size.width * 0.04444),
                    height: 100,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color(0xff89CFFD),
                    ),
                  ),
                  Container(
                    //MediaQuery.of(context).size.width * 0.9111,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.10875,
                        left: MediaQuery.of(context).size.width * 0.04444,
                        right: MediaQuery.of(context).size.width * 0.04444),
                    padding: const EdgeInsets.only(
                      left: 30,
                      right: 30,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color(0xff89CFFD),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        MultiSelectBottomSheetField(
                          initialChildSize: 0.4,
                          listType: MultiSelectListType.CHIP,
                          searchable: true,
                          buttonText: const Text("Select Blocks"),
                          title: const Text("List Of Blocks"),
                          items: widget.index
                              .map((e) => MultiSelectItem(e, e))
                              .toList(),
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
                        const SizedBox(
                          height: 15,
                        ),
                        FloatingActionButton(
                          onPressed: () async {
                            //List m = () as List;
                            Map<String, dynamic> m = await p.listtoSave({"email" : widget.email.toString()});

                            bool notInMap = true;
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
                           // print("========> ${m}");

                            if (!notInMap) {
                              m.update(widget.projectName.toString(),
                                  (value) => forApi);
                            }

                            if (notInMap) {
                              m[widget.projectName] = forApi;
                            }

                           // print(widget.email);
                           // print("========> ${m}");

                            p.updateActiveEmployees({"email": widget.email.toString(), "permitted_site" : m});



                          },
                          child: const SizedBox(
                            height: 50,
                            width: 150,
                            child: Icon(Icons.add),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.075,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
