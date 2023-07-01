// ignore_for_file: prefer_const_constructors

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app/Booking/Book_spot.dart';
import 'package:parking_app/Gates/gates_screen.dart';
import 'package:parking_app/scannar/create.dart';
import 'package:parking_app/screen/Auth/Sign%20in.dart';
import 'package:parking_app/screen/home/Feedback.dart';
import 'package:parking_app/screen/home/history.dart';
import 'package:parking_app/maps/current.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final currentUser = FirebaseAuth.instance;

  // final FirebaseAuth _auth = FirebaseAuth.instance;

  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldkey,
        appBar: AppBar(
          iconTheme: IconThemeData(
            size: 30,
            color: Colors.deepPurple,
          ),
          leadingWidth: 40,
          elevation: 0,
          // الظلال
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.white,
           systemNavigationBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.white,
          ),
          toolbarHeight: 60,
          title: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("Users")
                  .where("uid",
                      isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
               return Container(
                 height: 70,
                 child: ListView.builder(
                   itemCount: snapshot.data!.docs.length,
                   itemBuilder: (context, i) {
                     var data = snapshot.data!.docs[0];
                     return Text('Welcome, ' + data['First Name']+ "" + data['Last Name'],
                     style: GoogleFonts.ubuntu(
                       fontWeight: FontWeight.bold,
                       color: Colors.deepPurple.shade600,
                     ),
                       textAlign: TextAlign.start,
                     );
                   },
                 ),
               );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text('Loading Data......'),
                  );
                }
              }),
        ),
        drawerScrimColor: Colors.transparent,
        drawer: Drawer(
          elevation: 10,
          child: Column(
            children: [
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("Users")
                      .where("uid",
                          isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          var data = snapshot.data!.docs[i];
                          return UserAccountsDrawerHeader(
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                            ),
                            accountName: Text(
                                data['First Name'] + "" + data['Last Name']),
                            accountEmail: Text(data['Email']),
                            currentAccountPicture: CircleAvatar(
                              radius: 0,
                              backgroundColor: Colors.transparent,
                              child: Image(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                  "images/00.png",
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Text('Loading Data......'),
                      );
                    }
                  }),
              ListTile(
                title: const Text("Home Page"),
                leading: const Icon(
                  Icons.home,
                  color: Colors.deepPurple,
                ),
                onTap: () {},
              ),
              ListTile(
                title: const Text("Parking Detail"),
                leading: const Icon(
                  Icons.local_parking,
                  color: Colors.deepPurple,
                ),
                onTap: () {},
              ),
              ListTile(
                title: const Text("Booking"),
                leading: const Icon(
                  Icons.bookmark_outline,
                  color: Colors.deepPurple,
                ),
                onTap: () {},
              ),
              ListTile(
                title: const Text("Location Area"),
                leading: const Icon(
                  Icons.location_on,
                  color: Colors.deepPurple,
                ),
                onTap: () {},
              ),
              ListTile(
                title: const Text("Feedback"),
                leading: const Icon(
                  Icons.feedback,
                  color: Colors.deepPurple,
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const FeedbackDialog(),
                  ));
                },
              ),
              ListTile(
                title: const Text("Share"),
                leading: const Icon(
                  Icons.share,
                  color: Colors.deepPurple,
                ),
                onTap: () {},
              ),
              ListTile(
                title: const Text("Logout"),
                leading: const Icon(
                  Icons.logout,
                  color: Colors.deepPurple,
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ));
                },
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          //scrollDirection: Axis.vertical,
          child: Column(
            children: [
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child: Container(
                 height: 200,
                 width: double.infinity,
                 decoration: BoxDecoration(
                   image: DecorationImage(
                     image:  AssetImage('images/pay.png'
                     )
                   )
                 ),
               ),
             ),
              const SizedBox(height: 15,),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => GetPoly()))
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        //padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        height: 100,
                        // color: Colors.white,
                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border:
                            Border.all(color: Colors.deepPurple, width: 2)),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                               Text(
                                "Location Area",
                                style: GoogleFonts.cairo(
                                    fontSize: 20, fontWeight: FontWeight.w900,color: Colors.black87),
                              ),
                              Spacer(),
                              Image(image: AssetImage('images/mapp.png')),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15,),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    GatesScreen())));
                        },
                      child: Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        //padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        height: 100,
                        // color: Colors.white,
                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border:
                            Border.all(color: Colors.deepPurple, width: 2)),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Text(
                                "Parking Status",
                                style: GoogleFonts.cairo(
                                    fontSize: 20, fontWeight: FontWeight.w900,color: Colors.black87),
                              ),
                              Spacer(),
                              Image(image: AssetImage('images/loginScreen.png',),fit: BoxFit.fill,),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15,),
              // Row(
              //   children: [
              //     Expanded(
              //       child: InkWell(
              //         onTap: (){
              //           // Navigator.push(
              //           //     context,
              //           //     MaterialPageRoute(
              //           //         builder: (context) => BooKSpot()));
              //
              //         },
              //         child: Container(
              //           margin: const EdgeInsets.only(left: 10, right: 10),
              //           //padding: const EdgeInsets.all(10),
              //           width: double.infinity,
              //           height: 100,
              //           // color: Colors.white,
              //           decoration: BoxDecoration(
              //
              //               borderRadius: BorderRadius.circular(10),
              //               color: Colors.white,
              //               border:
              //               Border.all(color: Colors.deepPurple, width: 2)),
              //           child: Padding(
              //             padding: const EdgeInsets.all(15),
              //             child: Row(
              //               children: [
              //                 Text(
              //                   "Booking Spots",
              //                   style: GoogleFonts.cairo(
              //                       fontSize: 20, fontWeight: FontWeight.w900,color: Colors.black87),
              //                 ),
              //                 Spacer(),
              //                 Image(image: AssetImage('images/images9.jpg',),fit: BoxFit.fill,),
              //               ],
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // const SizedBox(height: 15,),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        if (QRId == null) {
                          AwesomeDialog(
                            context: context,
                            borderSide: BorderSide(
                                color: Colors.green, width: 2),
                            buttonsBorderRadius:
                            BorderRadius.all(Radius.circular(2)),
                            dialogType: DialogType.error,
                            headerAnimationLoop: false,
                            title: 'You need to Book your Spot First',
                            desc:
                            'go to Booking slot and choose your spot and pay',
                            showCloseIcon: true,
                            btnOkOnPress: () {},
                          ).show();
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const CreateScreen()));
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        //padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        height: 100,
                        // color: Colors.white,
                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border:
                            Border.all(color: Colors.deepPurple, width: 2)),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Text(
                                "Scan your QR",
                                style: GoogleFonts.cairo(
                                    fontSize: 20, fontWeight: FontWeight.w900,color: Colors.black87),
                              ),
                              Spacer(),
                              Image(image: AssetImage('images/qr.png',),fit: BoxFit.fill,),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15,),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const History()));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        //padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        height: 100,
                        // color: Colors.white,
                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border:
                            Border.all(color: Colors.deepPurple, width: 2)),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Text(
                                "History Of Parking",
                                style: GoogleFonts.cairo(
                                    fontSize: 20, fontWeight: FontWeight.w900,color: Colors.black87),
                              ),
                              Spacer(),
                              Image(image: AssetImage('images/Vector.png',),fit: BoxFit.fill,),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15,),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FeedbackDialog()));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        //padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        height: 100,
                        // color: Colors.white,
                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border:
                            Border.all(color: Colors.deepPurple, width: 2)),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Text(
                                "Feedback",
                                style: GoogleFonts.cairo(
                                    fontSize: 20, fontWeight: FontWeight.w900,color: Colors.black87),
                              ),
                              Spacer(),
                              Image(image: AssetImage('images/feed.png',),fit: BoxFit.fill,),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15,),


            ],
          ),
        ));
  }
}
