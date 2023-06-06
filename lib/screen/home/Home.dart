// ignore_for_file: prefer_const_constructors

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parking_app/Booking/Book_spot.dart';
import 'package:parking_app/Views/Home_spot/Spots.dart';
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
          title: const Text("HomePage"),
          // actions: [
          //   IconButton( icon: const Icon(Icons.exit_to_app),
          //   onPressed: ()async{
          //       Navigator.of(context).push(MaterialPageRoute(
          //                     builder: (context) => const SignIn(),
          //                   ));
          //     await FirebaseAuth.instance.signOut();

          //   },
          //   ),
          //   IconButton(icon: const Icon(Icons.arrow_back),onPressed: (){},),
          // ],
          elevation: 10, // الظلال
          backgroundColor: Colors.purple,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          toolbarHeight: 70,
        ),
        drawerScrimColor: Colors.deepPurple,
        drawer: Drawer(
          child: Column(
            children: [
              // StreamBuilder(
              //   stream: _auth.authStateChanges(),
              //   builder:
              //       (BuildContext context, AsyncSnapshot<User?> snapshot) {
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       // Show a progress indicator while waiting for data
              //       return CircularProgressIndicator();
              //     } else {
              //       if (snapshot.hasData) {
              //         // If the user is signed in, display their name and email in the Drawer
              //         return UserAccountsDrawerHeader(
              //             accountName: Text(snapshot.data!.displayName ?? ''),
              //             accountEmail: Text(snapshot.data!.email ?? ''),
              //             currentAccountPicture: CircleAvatar(
              //               radius: 100,
              //               backgroundColor: Colors.black,
              //               backgroundImage: AssetImage(
              //                 "images/hesham4.jpg",
              //               ),
              //             ));
              //       } else {
              //         // If the user is not signed in, display a message in the Drawer
              //         return DrawerHeader(
              //           child: Text('Not signed in'),
              //         );
              //       }
              //     }
              //   },
              // ),
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
                            accountName: Text(
                                data['First Name'] + " " + data['Last Name']),
                            accountEmail: Text(data['Email']),
                            currentAccountPicture: CircleAvatar(
                              radius: 100,
                              backgroundColor: Colors.black,
                              backgroundImage: AssetImage(
                                "images/profile.png",
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
              //  const UserAccountsDrawerHeader(
              //   accountName: Text("Hesham Elsaaady"),
              //   accountEmail: Text("Hesham@gmail.com"),
              //   currentAccountPicture: CircleAvatar(
              //     radius: 100,
              //     backgroundColor: Colors.black,
              //     backgroundImage: AssetImage("images/hesham4.jpg",),
              //   ),),

              ListTile(
                title: const Text("homepage"),
                leading: const Icon(Icons.home),
                onTap: () {},
              ),
              ListTile(
                title: const Text("Parking Detail"),
                leading: const Icon(Icons.local_parking),
                onTap: () {},
              ),
              ListTile(
                title: const Text("Booking"),
                leading: const Icon(Icons.bookmark_outline),
                onTap: () {},
              ),
              ListTile(
                title: const Text("Location Area"),
                leading: const Icon(Icons.location_on),
                onTap: () {},
              ),
              ListTile(
                title: const Text("Feedback"),
                leading: const Icon(Icons.feedback),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const FeedbackDialog(),
                  ));
                },
              ),
              ListTile(
                title: const Text("Share"),
                leading: const Icon(Icons.share),
                onTap: () {},
              ),
              ListTile(
                title: const Text("Logout"),
                leading: const Icon(Icons.logout),
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
          //scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                height: 150,
                color: Colors.blueGrey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    CircleAvatar(
                      backgroundImage: AssetImage("images/9.png"),
                      radius: 30,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Hello , user",
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Car Parking ",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Parking is the act of stopping and disengaging a Vehicle",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
              ),
              const SizedBox(
                height: 25,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        //padding: const EdgeInsets.all(10),
                        width: 100,
                        height: 120,
                        // color: Colors.white,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border:
                                Border.all(color: Colors.blueGrey, width: 2)),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => GetPoly())));
                                },
                                icon: Image.asset(
                                  "images/gps.png",
                                  fit: BoxFit.fill,
                                ),
                                iconSize: 60,
                              ),

                              // color: Colors.green,
                            ),
                            const Text(
                              "Location_Area",
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w900),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          //padding: const EdgeInsets.all(10),
                          width: 100,
                          height: 120,
                          // color: Colors.white,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border:
                                  Border.all(color: Colors.blueGrey, width: 2)),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: IconButton(
                                  onPressed: () {

                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => BooKSpot()));
                                  },
                                  icon: Image.asset(
                                    "images/images9.jpg",
                                    fit: BoxFit.fill,
                                  ),
                                  iconSize: 60,
                                ),

                                // color: Colors.green,
                              ),
                              const Text(
                                "Booking_slots",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w900),
                              )
                            ],
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        //padding: const EdgeInsets.all(10),
                        width: 100,
                        height: 120,
                        // color: Colors.white,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border:
                                Border.all(color: Colors.blueGrey, width: 2)),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              ParkingSpotsScreen())));
                                },
                                icon: Image.asset(
                                  "images/images4.jpg",
                                  fit: BoxFit.fill,
                                ),
                                iconSize: 60,
                              ),

                              // color: Colors.green,
                            ),
                            const Text(
                              "Parking_Status",
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w900),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      //padding: const EdgeInsets.all(10),
                      width: 100,
                      height: 120,
                      // color: Colors.white,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(color: Colors.blueGrey, width: 2)),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: IconButton(
                              onPressed: () {
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
                                    desc: 'go to Booking slot and choose your spot and pay',
                                    showCloseIcon: true,
                                    
                                    btnOkOnPress: () {},
                                  ).show();
                                }
                                else{
                                   Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const CreateScreen()));
                                }

                               
                              },
                              icon: Image.asset(
                                "images/qr.jpg",
                                fit: BoxFit.fill,
                              ),
                              iconSize: 60,
                            ),

                            // color: Colors.green,
                          ),
                          const Text(
                            "Scan your QR",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w900),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      //padding: const EdgeInsets.all(10),
                      width: 100,
                      height: 120,
                      // color: Colors.white,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(color: Colors.blueGrey, width: 2)),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const History()));
                              },
                              icon: Image.asset(
                                "images/history.png",
                                fit: BoxFit.fill,
                              ),
                              iconSize: 50,
                            ),

                            // color: Colors.green,
                          ),
                          const Text(
                            "History",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w900),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          //padding: const EdgeInsets.all(10),
                          width: 100,
                          height: 120,
                          // color: Colors.white,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border:
                                  Border.all(color: Colors.blueGrey, width: 2)),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          const FeedbackDialog(),
                                    ));
                                  },
                                  icon: Image.asset(
                                    "images/feedback.png",
                                    fit: BoxFit.fitHeight,
                                  ),
                                  iconSize: 60,
                                ),

                                // color: Colors.green,
                              ),
                              const Text(
                                "FeedBack",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w900),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ]),

                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        //padding: const EdgeInsets.all(10),
                        width: 100,
                        height: 120,
                        // color: Colors.white,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border:
                                Border.all(color: Colors.blueGrey, width: 2)),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  "images/paymob1.png",
                                  fit: BoxFit.fill,
                                ),
                                iconSize: 60,
                              ),

                              // color: Colors.green,
                            ),
                            const Text(
                              "PayMob",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w900),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  // const SizedBox(height: 10,),
                  // // Container(
                  // //       margin: const EdgeInsets.only(left: 10,right: 10),
                  // //       //padding: const EdgeInsets.all(10),
                  // //       width: 100,
                  // //       height: 120,
                  // //      // color: Colors.white,
                  // //       decoration: BoxDecoration(
                  // //         borderRadius: BorderRadius.circular(10),
                  // //         color: Colors.white,
                  // //         border: Border.all(color: Colors.blueGrey,width: 2)
                  // //       ),
                  // //       child: Column(
                  // //         children: [
                  // //           Container(
                  // //           padding: const EdgeInsets.all(10),
                  // //            child: IconButton(onPressed: (){

                  // //            },
                  // //            icon: Image.asset("images/Date.png",fit: BoxFit.fill,),
                  // //            iconSize: 60,
                  // //            ),

                  // //            // color: Colors.green,
                  // //           ),
                  // //           const Text("Parking_Date",style: TextStyle(fontSize: 13, fontWeight: FontWeight.w900),)
                  // //         ],

                  // //       ),

                  // // ),
                  //    ],
                  //  ),
                  //  const SizedBox(width: 2,),
                  //  Column(
                  //    children: [
                  //      Container(
                  //       margin: const EdgeInsets.only(left: 10,right: 10),
                  //       //padding: const EdgeInsets.all(10),
                  //       width: 100,
                  //       height: 120,
                  //      // color: Colors.white,
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(10),
                  //         color: Colors.white,
                  //         border: Border.all(color: Colors.blueGrey,width: 2)
                  //       ),
                  //       child: Column(
                  //         children: [
                  //           Container(
                  //           padding: const EdgeInsets.all(10),
                  //            child: IconButton(onPressed: (){

                  //            },
                  //            icon: Image.asset("images/images4.jpg",fit: BoxFit.fill,),
                  //            iconSize: 60,
                  //            ),

                  //            // color: Colors.green,
                  //           ),
                  //           const Text("Parking_Status",style: TextStyle(fontSize: 13, fontWeight: FontWeight.w900),)
                  //         ],

                  //       ),
                  // ),
                  // const SizedBox(height: 10,),
                  // Container(
                  //       margin: const EdgeInsets.only(left: 10,right: 10),
                  //       //padding: const EdgeInsets.all(10),
                  //       width: 100,
                  //       height: 120,
                  //      // color: Colors.white,
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(10),
                  //         color: Colors.white,
                  //         border: Border.all(color: Colors.blueGrey,width: 2)
                  //       ),
                  //       child: Column(
                  //         children: [
                  //           Container(
                  //           padding: const EdgeInsets.all(10),
                  //            child: IconButton(onPressed: (){
                  //              Navigator.push(context, MaterialPageRoute(
                  //           builder: (context)=>const BooKSpot()));

                  //            },
                  //            icon: Image.asset("images/images9.jpg",fit: BoxFit.fill,),
                  //            iconSize: 60,
                  //            ),

                  //            // color: Colors.green,
                  //           ),
                  //           const Text("Booking_slots",style: TextStyle(fontSize: 13, fontWeight: FontWeight.w900),)
                  //         ],

                  //       ),
                  // ),
                  // const SizedBox(height: 10,),
                  //  Container(
                  //       margin: const EdgeInsets.only(left: 10,right: 10),
                  //       //padding: const EdgeInsets.all(10),
                  //       width: 100,
                  //       height: 120,
                  //      // color: Colors.white,
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(10),
                  //         color: Colors.white,
                  //         border: Border.all(color: Colors.blueGrey,width: 2)
                  //       ),
                  //       child: Column(
                  //         children: [
                  //           Container(
                  //           padding: const EdgeInsets.all(10),
                  //            child: IconButton(onPressed: (){

                  //            },
                  //            icon: Image.asset("images/feedback.png",fit: BoxFit.fitHeight,),
                  //            iconSize: 60,
                  //            ),

                  //            // color: Colors.green,
                  //           ),
                  //           const Text("FeedBack",style: TextStyle(fontSize: 13, fontWeight: FontWeight.w900),)
                  //         ],

                  //       ),
                  // ),
                ],
              )
            ],
          ),
        ));
  }
}
