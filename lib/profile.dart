// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';

// class ProfileTalent extends StatelessWidget {
//   const ProfileTalent({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var mediaQueryWidth = MediaQuery.of(context).size.width;
//     var mediaQueryHeight = MediaQuery.of(context).size.height;

//     FirebaseFirestore firestore = FirebaseFirestore.instance;
//     CollectionReference talent = firestore.collection('talent');
    
//     return Scaffold(
//       appBar: AppBar(
//         title: StreamBuilder<QuerySnapshot>(
//           stream: talent.snapshots(),
//           builder: (_, snapshot) {
//             return (snapshot.hasData)
//                 ? Text(snapshot.data?.docs[0].get('name'))
//                 : Text('Talent Name');
//           },
//         ),
//       ),
//       // body: Stack(
//       //   children: [
//       //     Container(
//       //       width: double.infinity,
//       //       decoration: BoxDecoration(
//       //         image: DecorationImage(
//       //           image: NetworkImage(image),
//       //         )
//       //       ),
//       //     ),
//       //   ],
//       // ),
//     );
//   }
// }
