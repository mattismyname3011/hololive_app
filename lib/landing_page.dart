import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hololive_app/main_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    var mediaQueryHeight = MediaQuery.of(context).size.height;

    var holoteam = mediaQueryHeight / 1.4;
    return Scaffold(
      body: Stack(alignment: Alignment.bottomCenter, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: mediaQueryWidth,
              height: mediaQueryHeight - holoteam,
              decoration: const BoxDecoration(
                // color: ,
                image: DecorationImage(
                  image: AssetImage('assets/hololive_logo.webp'),
                ),
              ),
            ),
            Container(
              width: mediaQueryWidth,
              height: holoteam,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/hololive_landing_page.webp"),
                    // scale: 2.0,
                    alignment: Alignment.center,
                    fit: BoxFit.cover),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(bottom: mediaQueryHeight / 12),
          child: InkWell(
            child: Container(
              width: mediaQueryWidth / 2,
              height: 65,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.9),
                border: Border.all(
                  color: Colors.white,
                  width: 1,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(30)),
              ),
              child: const Center(
                child: Text(
                  "HOLOLIVE",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
            onTap: () {
              Get.off(MainPage());
            },
          ),
        ),
      ]),
    );
  }
}
