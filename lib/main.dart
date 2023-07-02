// ignore_for_file: unused_import
import 'dart:async';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parking_app/Booking/Book_spot.dart';
import 'package:parking_app/Views/Home_spot/Spots.dart';
import 'package:parking_app/Views/Spots/Spot_B.dart';
import 'package:parking_app/pay/core/network/dio_helper.dart';
import 'package:parking_app/pay/modules/screens/register_screen.dart';
import 'package:parking_app/pay/modules/screens/toggle_screen.dart';
import 'package:parking_app/screen/Auth/Sign%20in.dart';
import 'package:parking_app/screen/Auth/Sign%20up.dart';
import 'package:parking_app/screen/home/Home.dart';
import 'package:parking_app/screen/home/history.dart';
import 'maps/current.dart';


var islogin;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.initDio();
  await Firebase.initializeApp();
  var user = FirebaseAuth.instance.currentUser;
  // current user return user information if he sign in
  if (user == null) {
    islogin = false;
  } else {
    islogin = true;
  }
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: islogin == false ? const LoginPage() :const Home(),
    );
  }
}