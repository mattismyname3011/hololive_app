import 'package:flutter/material.dart';
import 'package:get/get.dart';

int total = 0;

class MessageCard extends StatelessWidget {
  final String talentName, talentImage, talentThumbnail;
  final String donationName, donationMessage;
  final donationMoney;
  // final int age;

  MessageCard(
    this.talentName,
    this.talentImage,
    this.talentThumbnail,
    this.donationName,
    this.donationMoney,
    this.donationMessage,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (donationName == talentName)
            ? Padding(
                // print(donationMoney);
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // minheight: 50,
                  constraints: BoxConstraints(minHeight: 50),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.7),
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Hello $donationName, $donationMessage. \nTake This Rp $donationMoney",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}
