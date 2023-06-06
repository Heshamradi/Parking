// // ignore_for_file: use_build_context_synchronously, prefer_const_constructors
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:parking_app/Booking/Book_spot.dart';

// var fire = FirebaseFirestore.instance.collection("Spots");

// class MyButton extends StatelessWidget {
//   final String name;

//   MyButton({
//     required this.name,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<DocumentSnapshot>(
//       future: fire.doc(name).get(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           // While waiting for the data to load, show a loading indicator
//           return Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: Colors.grey,
//             ),
//             child: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         } else if (snapshot.hasError) {
//           // If there was an error getting the data, show an error message
//           return Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: Colors.red,
//             ),
//             child: Center(
//               child: Text(
//                 "Error",
//                 style: TextStyle(fontSize: 25, color: Colors.white),
//               ),
//             ),
//           );
//         } else {
//           bool spot_state = snapshot.data?["bol"] ?? false;
//           return GestureDetector(
//             onTap: () async {
//               if (spot_state) {
//                 await Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => BooKSpot(
//                       spotname: name,
//                       state: spot_state,
//                     ),
//                   ),
//                 );
//               } else {
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       title: Text('Sorry'),
//                       content: Text('This spot is unavailable.'),
//                       actions: [
//                         TextButton(
//                           child: Text('OK'),
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               }
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: spot_state ? Colors.green : Colors.red,
//               ),
//               child: Center(
//                 child: Text(
//                   "$name",
//                   style: TextStyle(fontSize: 25, color: Colors.white),
//                 ),
//               ),
//             ),
//           );
//         }
//       },
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parking_app/shared/picktime.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  String locationspot;
  String name;
  MyButton({super.key, 
    required this.locationspot,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var fire = FirebaseFirestore.instance.collection(locationspot);
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => BoxPage(
                      spot: name,
                      locationspot: locationspot,
                    ))));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.purple,
        ),
        child: Center(
          child: Text(
            name,
            style: const TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
