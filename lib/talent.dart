import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hololive_app/widget/item_card.dart';

class Talent extends StatelessWidget {
  const Talent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference talent = firestore.collection('talent');
     return Stack(
        children: [
          ListView(
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: talent.snapshots(),
                builder: (_, snapshot) {
                  return (snapshot.hasData)
                      ? Column(
                          children: snapshot.data!.docs
                              .map(
                                (e) => ItemCard(
                                  e.get('name'),
                                  e.get('image'),
                                  e.get('quotes'),
                                  e.get('thumbnail'),
                                  e.get('twitter'),
                                  e.get('youtube'),
                                  onUpdate: () {},
                                  onDelete: () {},
                                ),
                              )
                              .toList())
                      : const Center(
                          child: Text('Loading...'),
                        );
                },
              )
            ],
          ),
        ],
      );
  }
}