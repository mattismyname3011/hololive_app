import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hololive_app/main_page.dart';
// import 'package:hololive_app/file_upload.dart';
import 'package:hololive_app/talent.dart';
import 'package:hololive_app/widget/messageCard.dart';

class donateLog extends StatelessWidget {
  // const donateTalent({Key? key}) : super(key: key);
  final String name, image, thumbnail;
  donateLog(this.name, this.image, this.thumbnail);

  @override
  Widget build(BuildContext context) {
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
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white,
                      Colors.yellow,
                    ]),
                image: DecorationImage(
                  image: NetworkImage(image),
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
                        StreamBuilder<QuerySnapshot>(
                            stream: donation.snapshots(),
                            builder: (_, snapshot) {
                              return (snapshot.hasData)
                                  ? Column(
                                      children: snapshot.data!.docs
                                          .map(
                                            (d) => MessageCard(
                                              name,
                                              image,
                                              thumbnail,
                                              d.get('name'),
                                              d.get('money'),
                                              d.get('message'),
                                            ),
                                          )
                                          .toList())
                                  : Center(
                                      child: Text('Loading...'),
                                    );
                            })
                      ],
                    ),
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
