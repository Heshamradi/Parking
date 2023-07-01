// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app/shared/button.dart';
// ignore: unused_import
import 'Spot_A.dart';

String s1 = "B1",
    s2 = "B2",
    s3 = "B3",
    s4 = "B4",
    s5 = "B5",
    s6 = "B6",
    s7 = "B7",
    s8 = "B8",
    s9 = "B9",
    s10 = "B10";
String spotB = "SpotsB";
var check = FirebaseFirestore.instance.collection("SpotsB");

class SpotB extends StatefulWidget {
  const SpotB({super.key});

  @override
  State<SpotB> createState() => _SpotBState();
}

class _SpotBState extends State<SpotB> {
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.white,
        ),
        iconTheme: IconThemeData(
          size: 30,
          color: Colors.deepPurple,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title:  Text("Spot B",style: GoogleFonts.ubuntu(
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple.shade600,
        ),),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: (100 / 40),
              crossAxisSpacing: 50,
              mainAxisSpacing: 20,
            ),
            children: <Widget>[
              MyButton(
                name: s1,
                locationspot: spotB,
              ),
              MyButton(
                name: s2,
                locationspot: spotB,
              ),
              MyButton(
                name: s3,locationspot: spotB,
              ),
              MyButton(
                name: s4,locationspot: spotB,
              ),
              MyButton(
                name: s5,locationspot: spotB,
              ),
              MyButton(
                name: s6,locationspot: spotB,
              ),
              MyButton(
                name: s7,locationspot: spotB,
              ),
              MyButton(
                name: s8,locationspot: spotB,
              ),
              MyButton(
                name: s9,locationspot: spotB,
              ),
              MyButton(
                name: s10,locationspot: spotB,
              ),
            ]),
      ),
    );
  }
}

// getdata() {
//   FutureBuilder(
//       future: FirebaseFirestore.instance.collection("Spots").doc(s1).get(),
//       builder: ((context, AsyncSnapshot snapshot) {
//         var f;
//         if (snapshot.hasData) {
//           return ListView.builder(
//             itemCount: snapshot.data.docs.lingth,
//             itemBuilder: (context, index) {
              
//               if (f = snapshot.data.docs[index].data()["bol"]) {
//                 if (f == "t") {
//                   a = true;
//                 }else if(f == 'f'){ a = false;}

//               }
//               ;
//             },
//           );
//         }
//         return Text("اي حاجه");
//       }));
// }
