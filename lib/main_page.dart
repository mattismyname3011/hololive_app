// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hololive_app/about.dart';
import 'package:hololive_app/talent.dart';
import '../controller/nav_controller.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final NavController c = Get.put(NavController());

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      Talent(),
      About(),
    ];
    return Obx(() => Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset("assets/hololive_icons.webp", height: 40),
            Text('hololive'),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.blue.shade800,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: GNav(
            padding: EdgeInsets.all(15),
            tabBackgroundColor: Colors.white.withOpacity(0.8),
            backgroundColor: Colors.blue.shade800,
            color: Colors.blue.shade200,
            activeColor: Colors.blue.shade900,
            selectedIndex: c.tabIndex.value,
            onTabChange: c.changeTabIndex,
            curve: Curves.easeInOutCubic,
            gap: 8,
            tabMargin: EdgeInsets.only(left: 30, right: 30),
            tabs: const [
              GButton(
                icon: Icons.person,
                text: 'Talent',
              ),
              GButton(
                icon: Icons.question_mark_rounded,
                text: 'About',
              ),
            ],
          ),
        ),
      ),
      body: pages[c.tabIndex.value],
    ));
  }
}
