import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parking_app/shared/button.dart';


String s1 = "C1",
    s2 = "C2",
    s3 = "C3",
    s4 = "C4",
    s5 = "C5",
    s6 = "C6",
    s7 = "C7",
    s8 = "C8",
    s9 = "C9",
    s10 = "C10";
String spotC = "SpotsC";
var check = FirebaseFirestore.instance.collection("SpotsC");

class Spot_C extends StatefulWidget {
  const Spot_C({super.key});

  @override
  State<Spot_C> createState() => _Spot_CState();
}

class _Spot_CState extends State<Spot_C> {
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Spot C"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: (100 / 40),
              crossAxisSpacing: 50,
              mainAxisSpacing: 20,
            ),
            children: <Widget>[
              MyButton(
                name: s1,
                locationspot: spotC,
              ),
              MyButton(
                name: s2,
                locationspot: spotC,
              ),
              MyButton(
                name: s3,locationspot: spotC,
              ),
              MyButton(
                name: s4,locationspot: spotC,
              ),
              MyButton(
                name: s5,locationspot: spotC,
              ),
              MyButton(
                name: s6,locationspot: spotC,
              ),
              MyButton(
                name: s7,locationspot: spotC,
              ),
              MyButton(
                name: s8,locationspot: spotC,
              ),
              MyButton(
                name: s9,locationspot: spotC,
              ),
              MyButton(
                name: s10,locationspot: spotC,
              ),
            ]),
      ),
    );
  }
}