import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app/Views/Spots/Spot_A.dart';
import 'package:parking_app/Views/Spots/Spot_B.dart';
import 'package:parking_app/Views/Spots/Spot_C.dart';
// ignore: unused_import
import '../../Booking/Book_spot.dart';

class ParkingSpotsScreen extends StatelessWidget {
final int? i;
  ParkingSpotsScreen  (this.i);
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
        title:  Text("Parking Spots",style: GoogleFonts.ubuntu(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),),
      ),

      body: i == 1 ?
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const Spot_A()));

                  },
                  child: Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),

                        gradient: const LinearGradient(
                            colors: [
                              Colors.deepPurple,
                              Colors.grey,
                            ]
                        ),

                      ),
                      height: 100,
                      width: double.infinity,
                      child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text('Spot-A',style: GoogleFonts.cairo(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
                        ),
                        Spacer(),
                        Image(image: AssetImage('images/Group 92.png')),

                      ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25,),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const SpotB()));

                  },
                  child: Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),

                        gradient: const LinearGradient(
                            colors: [
                              Colors.deepPurple,
                              Colors.grey,
                            ]
                        ),

                      ),
                      height: 100,
                      width: double.infinity,
                      child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text('Spot-B',style: GoogleFonts.cairo(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
                        ),
                        Spacer(),
                        Image(image: AssetImage('images/Group 92.png')),

                      ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25,),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const Spot_C()));

                  },
                  child: Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),

                        gradient: const LinearGradient(
                            colors: [
                              Colors.deepPurple,
                              Colors.grey,
                            ]
                        ),

                      ),
                      height: 100,
                      width: double.infinity,
                      child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text('Spot-C',style: GoogleFonts.cairo(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
                        ),
                        Spacer(),
                        Image(image: AssetImage('images/Group 92.png')),

                      ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25,),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const Spot_A()));

                  },
                  child: Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),

                        gradient: const LinearGradient(
                            colors: [
                              Colors.deepPurple,
                              Colors.grey,
                            ]
                        ),

                      ),
                      height: 100,
                      width: double.infinity,
                      child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text('Spot-D',style: GoogleFonts.cairo(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
                        ),
                        Spacer(),
                        Image(image: AssetImage('images/Group 92.png')),

                      ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ):
      //  Container(child: Padding(
      //   padding: const EdgeInsets.only(top: 60, left: 20, right: 20, ),
      //   child: GridView(
      //
      //
      //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2,
      //     mainAxisSpacing: 30,
      //     crossAxisSpacing: 30),
      //
      //
      //     children: <Widget>[
      //     InkWell(
      //       onTap: (){
      //         Navigator.push(context, MaterialPageRoute(builder: (context)=>const Spot_A()));
      //       },
      //       child: Container(
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(20),
      //           color: Colors.purple,),
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         // ignore: prefer_const_literals_to_create_immutables
      //         children: [
      //         Icon(Icons.car_crash_outlined,size: 80,color: Colors.white,),
      //         // ignore: prefer_const_constructors
      //         Text("Spot A",style: TextStyle(color: Colors.white,fontSize: 30),)
      //       ],),
      //       ),
      //     ),
      //    InkWell(
      //        onTap: (){
      //         Navigator.push(context, MaterialPageRoute(builder: (context)=>const SpotB()));
      //       },
      //      child: Container(
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(20),
      //         color: Colors.purple,),
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //
      //         // ignore: prefer_const_literals_to_create_immutables
      //         children: [
      //         Icon(Icons.car_crash,size: 80,color: Colors.white,),
      //         Text("Spot B ",style: TextStyle(color: Colors.white,fontSize: 30),)
      //       ],),
      //       ),
      //    ),
      //     InkWell(
      //         onTap: (){
      //
      //         Navigator.push(context, MaterialPageRoute(builder: (context)=>const Spot_C()));
      //
      //       },
      //       child: Container(
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(20),
      //           color: Colors.purple,),
      //       child:  Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //         Icon(Icons.car_crash,size: 80,color: Colors.white,),
      //         Text("Spot C",style: TextStyle(color: Colors.white,fontSize: 30),)
      //       ],),
      //       ),
      //     ),
      //     InkWell(
      //         onTap: (){
      //         Navigator.push(context, MaterialPageRoute(builder: (context)=>const Spot_A()));
      //       },
      //       child: Container(
      //         padding: const EdgeInsets.only(top: 5),
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(20),
      //            color: Colors.purple,
      //           ),
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children:  [
      //           Image.asset("images/disabled.png",fit: BoxFit.cover,height: 90,width: 100,),
      //           const SizedBox(height: 5,),
      //           const Text("Spot ",style: TextStyle(color: Colors.black,fontSize: 30),)
      //       ],),
      //       ),
      //     ),
      //   ],
      //   ),
      // ),):
      Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const SpotB()));

              },
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),

                    gradient: const LinearGradient(
                        colors: [
                          Colors.deepPurple,
                          Colors.grey,
                        ]
                    ),

                  ),
                  height: 100,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text('Spot-B',style: GoogleFonts.cairo(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
                      ),
                      Spacer(),
                      Image(image: AssetImage('images/Group 92.png')),

                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 25,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Spot_C()));

              },
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),

                    gradient: const LinearGradient(
                        colors: [
                          Colors.deepPurple,
                          Colors.grey,
                        ]
                    ),

                  ),
                  height: 100,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text('Spot-C',style: GoogleFonts.cairo(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
                      ),
                      Spacer(),
                      Image(image: AssetImage('images/Group 92.png')),

                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 25,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Spot_A()));

              },
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),

                    gradient: const LinearGradient(
                        colors: [
                          Colors.deepPurple,
                          Colors.grey,
                        ]
                    ),

                  ),
                  height: 100,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text('Spot-A',style: GoogleFonts.cairo(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
                      ),
                      Spacer(),
                      Image(image: AssetImage('images/Group 92.png')),

                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 25,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Spot_A()));

              },
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),

                    gradient: const LinearGradient(
                        colors: [
                          Colors.deepPurple,
                          Colors.grey,
                        ]
                    ),

                  ),
                  height: 100,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text('Spot-D',style: GoogleFonts.cairo(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
                      ),
                      Spacer(),
                      Image(image: AssetImage('images/Group 92.png')),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
