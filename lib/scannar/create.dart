import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:parking_app/Booking/Book_spot.dart';
import 'package:parking_app/screen/home/Home.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your QR code"),
      actions: [
        IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: ((context) => const Home())));
        }, icon: const Icon(Icons.home))
      ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BarcodeWidget(data: QRId!, barcode: Barcode.qrCode(),color: Colors.blue,
          height: 250,
          width: 250,
          ),
          // Container(
          //   alignment: Alignment.center,
          //   width: MediaQuery.of(context).size.width*.8,
          //   child: const TextField(
          //     decoration: InputDecoration(
          //       hintText: "Enter your data here",
          //       border: OutlineInputBorder(
          //         borderSide: BorderSide(
          //           color: Colors.blue,
          //           width: 2,
          //         )
          //       )
          //     ),
          //   ),
          // ),
          SizedBox(width: MediaQuery.of(context).size.width,),
        ],
      ),
    );
  }
}