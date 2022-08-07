import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hololive_app/donation-log.dart';
import 'package:hololive_app/form-donation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

class ProfileCard extends StatelessWidget {
  final String name, thumbnail, image, quotes, twitter, youtube;
  bool _hasCallSupport = false;
  Future<void>? _launched;
  String _phone = '';

  ProfileCard(this.name, this.image, this.quotes, this.thumbnail, this.twitter,
      this.youtube);

  Future<void> openUrl(String url,
      {bool forceWebview = false, enableJavaScript = false}) async {
    await launch(url);
  }


  @override
  Widget build(BuildContext context) {
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
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white,
                      Colors.blue,
                    ]),
                image: DecorationImage(
                  image: NetworkImage(image),
                  // fit: BoxFit.fill,
                )),
          ),

          // mainAxisAlignment: MainAxisAlignment.end,

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
                          // alignment: Alignment.bottomCenter,
                          width: mediaQueryWidth,
                          height: overflow,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadiusDirectional.only(
                                topStart: Radius.circular(30),
                                topEnd: Radius.circular(30)),
                            // borderRadius: BorderRadius.all(Radius.circular(30)),
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
                        const SizedBox(
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
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: mediaQueryHeight / 1.5),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () async {
                                  await openUrl(youtube);
                                },
                                child: Container(
                                  width: mediaQueryWidth / 2,
                                  height: mediaQueryHeight / 15,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    color: Colors.blue,
                                  ),
                                  child: const Center(
                                    child: Text("Youtube"),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  await openUrl(twitter);
                                },
                                child: Container(
                                  width: mediaQueryWidth / 2,
                                  height: mediaQueryHeight / 15,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    color: Colors.blue,
                                  ),
                                  child: const Center(
                                    child: Text("Twitter"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: mediaQueryHeight / 5.5,
                          // color: Colors.red,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              quotes,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 23),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: mediaQueryWidth - 75, top: margintop + 10),
                      child: FloatingActionButton(
                        heroTag: null,
                        onPressed: () {
                          Get.to(donateTalent(name, image, thumbnail));
                        },
                        child: const Icon(
                          Icons.wallet_giftcard,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, top: margintop + 10),
                      child: FloatingActionButton(
                          heroTag: null,
                          onPressed: () {
                            Get.to(donateLog(name, image, thumbnail));
                          },
                          child: const Icon(
                            Icons.list_rounded,
                            size: 45,
                          )),
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
