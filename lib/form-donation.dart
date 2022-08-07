import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hololive_app/main_page.dart';
import 'package:hololive_app/talent.dart';

class donateTalent extends StatelessWidget {
  final String name, image, thumbnail;
  donateTalent(this.name, this.image, this.thumbnail);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController moneyController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SnackBar mySnackBar(String text) {
      return SnackBar(
        content: Text(
          text,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        action: SnackBarAction(
          label: 'dismiss',
          textColor: Colors.white,
          onPressed: () {},
        ),
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.only(left: 15, right: 15),
      );
    }

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference donation = firestore.collection('donation');

    var mediaQueryWidth = MediaQuery.of(context).size.width;
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var overflow = mediaQueryHeight / 1.75;
    var margintop = mediaQueryHeight / 2.3;
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          // FloatingActionButton(onPressed: (){}),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white,
                      Colors.red,
                    ]),
                image: DecorationImage(
                  image: NetworkImage(image),
                  // fit: BoxFit.fill,
                )),
          ),

          Expanded(
            child: ListView(
              children: [
                Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: mediaQueryWidth,
                          height: mediaQueryHeight - overflow,
                        ),
                        Container(
                          width: mediaQueryWidth,
                          height: overflow,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.only(
                                topStart: Radius.circular(30),
                                topEnd: Radius.circular(30)),
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Center(
                          child: Padding(
                            padding:
                                EdgeInsets.only(top: mediaQueryHeight / 3.5),
                            child: CircleAvatar(
                              radius: mediaQueryWidth / 3.7,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: mediaQueryWidth / 4,
                                backgroundImage: NetworkImage(thumbnail),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: mediaQueryWidth / 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: (mediaQueryWidth) + 125),
                        child: Column(
                          children: [
                            Container(
                              width: mediaQueryWidth - 50,
                              color: Colors.white.withOpacity(0.7),
                              child: TextField(
                                controller: moneyController,
                                decoration: InputDecoration(
                                  hintText: "Enter Amount will be donated (Rp)",
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            Container(
                              width: mediaQueryWidth - 50,
                              color: Colors.white.withOpacity(0.7),
                              child: TextField(
                                controller: messageController,
                                decoration: InputDecoration(
                                  hintText: "Enter Message for " + name,
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                          title: Text("Confirmation"),
                                          content: Text(
                                              "Are you sure you want to donate Rp ${moneyController.text} to ${name}?"),
                                          actions: [
                                            FlatButton(
                                              child: Text("Yes"),
                                              onPressed: () {
                                                Navigator.pop(context);
                                                // setState(() {
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        title: Text("Success"),
                                                        content: Text(
                                                            "Thank you for your donation"),
                                                        actions: [
                                                          FlatButton(
                                                            child: Text("OK"),
                                                            onPressed: () {
                                                              try {
                                                                donation.add({
                                                                  'name': name,
                                                                  'money': int.parse(
                                                                      moneyController
                                                                          .text),
                                                                  'message':
                                                                      messageController
                                                                          .text,
                                                                });
                                                                SnackBar
                                                                    snackBar =
                                                                    mySnackBar(
                                                                        "Succesfully donate");
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                        snackBar);
                                                              } catch (e) {
                                                                SnackBar
                                                                    snackBar =
                                                                    mySnackBar(
                                                                        "Failed donate");
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                        snackBar);
                                                                throw (e
                                                                    .toString());
                                                              }
                                                              ;
                                                              Navigator.pop(
                                                                  context);
                                                              // Scaffold(
                                                              Get.off(
                                                                  MainPage());
                                                              // );
                                                            },
                                                          )
                                                        ],
                                                      );
                                                    });
                                                // );
                                              },
                                            ),
                                            FlatButton(
                                              child: Text("No"),
                                              onPressed: () {
                                                Navigator.pop(context);
                                                // setState(()
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        title:
                                                            Text("Cancelled"),
                                                        content: Text(
                                                            "Donation Cancelled"),
                                                        actions: [
                                                          FlatButton(
                                                            child: Text("OK"),
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                          )
                                                        ],
                                                      );
                                                    });
                                                // );
                                              },
                                            ),
                                          ]);
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.send,
                                  size: 40,
                                ))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
