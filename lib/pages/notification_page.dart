import 'package:flutter/material.dart';
import 'package:flutter_app/Server%20(Back%20End)/network_handler.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<bool> selected = [];
  int num = 1;
  NetworkHandler p = NetworkHandler();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              left: 16,
              top: MediaQuery.of(context).size.height * 0.05875,
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
            top: MediaQuery.of(context).size.height * 0.05875,
            child: const Text(
              "Notification",
              style: TextStyle(fontSize: 28),
            ),
          ),
          Positioned(
            left: 20,
            top: MediaQuery.of(context).size.height * 0.13,
            child: const Text(
              "New Request",
              style: TextStyle(fontSize: 20, color: Color(0xff0094FF)),
            ),
          ),
          StreamBuilder<List>(
            builder: (context, snapshot) {
              if (ConnectionState.waiting == snapshot.connectionState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }


             // print(snapshot.data?.length);

              if (snapshot.hasData) {

                int len = snapshot.data!.length;
                if(len>0)
                  {
                    snapshot.data?.forEach((element) {
                      selected.add(false);
                    });
                    return Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.18875,
                          left: 16,
                          right: 16),
                      child: ListView.builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, i) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selected[i] = !selected[i];
                                });
                              },
                              child: AnimatedContainer(
                                margin: const EdgeInsets.only(bottom: 20),
                                duration: Duration.zero,
                                height: selected[i]
                                    ? MediaQuery.of(context).size.height * 0.2525
                                    : MediaQuery.of(context).size.height * 0.19,
                                width: MediaQuery.of(context).size.width * 0.91111,
                                decoration: BoxDecoration(
                                  color: const Color(0xffBDE6F1),
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                        top: MediaQuery.of(context).size.height *
                                            0.03,
                                        left: MediaQuery.of(context).size.width *
                                            0.05,
                                        child: const CircleAvatar(
                                          radius: 30,
                                          backgroundColor: Colors.white,
                                          child: CircleAvatar(
                                            radius: 19,
                                            backgroundColor: Color(0xff001E6C),
                                            child: Center(
                                              child: Icon(
                                                Icons.account_circle_sharp,
                                                size: 38,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        )),
                                    Positioned(
                                      top:
                                      MediaQuery.of(context).size.height * 0.04,
                                      left: MediaQuery.of(context).size.width *
                                          0.23111,
                                      child: Text(
                                        snapshot.data![i]["username"],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Positioned(
                                      top: MediaQuery.of(context).size.height *
                                          0.06125,
                                      left: MediaQuery.of(context).size.width *
                                          0.23111,
                                      child: Text(
                                        snapshot.data![i]["email"],
                                        style: const TextStyle(
                                            color: Colors.black38, fontSize: 12),
                                      ),
                                    ),
                                    Positioned(
                                      top: MediaQuery.of(context).size.height *
                                          0.13625,
                                      left: MediaQuery.of(context).size.width *
                                          0.06944,
                                      child: const Text(
                                        "Role",
                                        style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Positioned(
                                      top: MediaQuery.of(context).size.height *
                                          0.15625,
                                      left: MediaQuery.of(context).size.width *
                                          0.06944,
                                      child: Text(
                                        snapshot.data![i]["designation"],
                                        style: const TextStyle(
                                            color: Colors.black38, fontSize: 12),
                                      ),
                                    ),
                                    if (selected[i]) Container(
                                        height:
                                        MediaQuery.of(context).size.height *
                                            0.04375,
                                        width:
                                        MediaQuery.of(context).size.width *
                                            0.3833333,
                                        margin: EdgeInsets.only(
                                            top: MediaQuery.of(context)
                                                .size
                                                .height *
                                                0.195,left:MediaQuery.of(context)
                                            .size
                                            .width *  0.055555),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(7),
                                        ),
                                        child: ElevatedButton(
                                          onPressed: () async{
                                            await p.deleteUser({"email": snapshot.data![i]["email"].toString()});
                                          },

                                          style: const ButtonStyle(
                                            elevation:
                                            MaterialStatePropertyAll(
                                                null),backgroundColor: MaterialStatePropertyAll(Colors.white), ),
                                          child: const Text("Decline",style: TextStyle(color: Colors.black),),
                                        )) else Container(),
                                    selected[i]
                                        ? Container(
                                        margin: EdgeInsets.only(
                                            top: MediaQuery.of(context)
                                                .size
                                                .height *
                                                0.195,
                                            left: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.477777),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(7),
                                        ),
                                        height:
                                        MediaQuery.of(context).size.height *
                                            0.04375,
                                        width:
                                        MediaQuery.of(context).size.width *
                                            0.3833333,
                                        child: ElevatedButton(
                                          onPressed: () async{
                                            await p.UserVerification({"email": snapshot.data![i]["email"].toString()});
                                          },

                                          style: const ButtonStyle(
                                            elevation:
                                            MaterialStatePropertyAll(
                                                null),backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(
                                              0, 30, 108, 0.74)), ),
                                          child: const Text("Accept",style: TextStyle(color: Colors.white),),
                                        ))
                                        : Container(),
                                  ],
                                ),
                              ),
                            );
                          }),
                    );
                  }
                else {
                  return Center(child: Text("No Data To Show"),);
                }
              }

              return const Text("Something Went Wrong");
            },
            stream: p.listnotification(),
          ),
        ],
      ),
    );
  }
}
