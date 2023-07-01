import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app/shared/button.dart';


String s1 = "A1",
    s2 = "A2",
    s3 = "A3",
    s4 = "A4",
    s5 = "A5",
    s6 = "A6",
    s7 = "A7",
    s8 = "A8",
    s9 = "A9",
    s10 = "A10";
String spotA = "SpotsA";
var check = FirebaseFirestore.instance.collection("SpotsA");

class Spot_A extends StatefulWidget {
  const Spot_A({super.key});

  @override
  State<Spot_A> createState() => _Spot_AState();
}

class _Spot_AState extends State<Spot_A> {
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
          color: Colors.white,
        ),
        elevation: 0,
        backgroundColor: Colors.deepPurple,
        title:  Text("Spot A",style: GoogleFonts.ubuntu(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),),
      ),

      body: Container(
        padding: const EdgeInsets.all(10),
        child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: (100 / 40),
              crossAxisSpacing: 20,
              mainAxisSpacing: 15,
            ),
            children: <Widget>[
              MyButton(
                name: s1,
                locationspot: spotA,
              ),
              MyButton(
                name: s2,
                locationspot: spotA,
              ),
              MyButton(
                name: s3,locationspot: spotA,
              ),
              MyButton(
                name: s4,locationspot: spotA,
              ),
              MyButton(
                name: s5,locationspot: spotA,
              ),
              MyButton(
                name: s6,locationspot: spotA,
              ),
              MyButton(
                name: s7,locationspot: spotA,
              ),
              MyButton(
                name: s8,locationspot: spotA,
              ),
              MyButton(
                name: s9,locationspot: spotA,
              ),
              MyButton(
                name: s10,locationspot: spotA,
              ),
            ]),
      ),
    );
  }
}