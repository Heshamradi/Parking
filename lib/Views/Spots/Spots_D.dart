import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parking_app/shared/button.dart';


String s1 = "D1",
    s2 = "D2",
    s3 = "D3",
    s4 = "D4",
    s5 = "D5",
    s6 = "D6",
    s7 = "D7",
    s8 = "D8",
    s9 = "D9",
    s10 = "D10";
String spot = "Spots";
var check = FirebaseFirestore.instance.collection("Spots");

class Spot_D extends StatefulWidget {
  const Spot_D({super.key});

  @override
  State<Spot_D> createState() => _Spot_DState();
}

class _Spot_DState extends State<Spot_D> {
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Spot A"),
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
                locationspot: spot,
              ),
              MyButton(
                name: s2,
                locationspot: spot,
              ),
              MyButton(
                name: s3,locationspot: spot,
              ),
              MyButton(
                name: s4,locationspot: spot,
              ),
              MyButton(
                name: s5,locationspot: spot,
              ),
              MyButton(
                name: s6,locationspot: spot,
              ),
              MyButton(
                name: s7,locationspot: spot,
              ),
              MyButton(
                name: s8,locationspot: spot,
              ),
              MyButton(
                name: s9,locationspot: spot,
              ),
              MyButton(
                name: s10,locationspot: spot,
              ),
            ]),
      ),
    );
  }
}