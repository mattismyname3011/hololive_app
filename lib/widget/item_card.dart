import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hololive_app/profile.dart';
import 'package:hololive_app/widget/profile_card.dart';

class ItemCard extends StatelessWidget {
  final String name, thumbnail, image, quotes, twitter, youtube;
  // final int age;
  //// Pointer to Update Function
  final Function? onUpdate;
  //// Pointer to Delete Function
  final Function? onDelete;

  ItemCard(this.name, this.image, this.quotes, this.thumbnail, this.twitter,
      this.youtube,
      {this.onUpdate, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.blue.shade500,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xfff78000),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 340 / 3.5,
              height: 340 / 3.5,
              decoration: BoxDecoration(
                // color: Colors.white.wit(0.2),
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(thumbnail),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black),
              ),
              child: Center(
                child: Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Get.to(ProfileCard(name, image, quotes, thumbnail, twitter, youtube));
      },
    );
  }
}
