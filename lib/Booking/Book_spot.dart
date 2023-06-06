// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, await_only_futures, use_build_context_synchronously, avoid_single_cascade_in_expression_statements, duplicate_ignore

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:parking_app/pay/modules/screens/register_screen.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


String Time = DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());

// ignore: must_be_immutable
class BooKSpot extends StatefulWidget {
   GlobalKey<FormState> formstate =  GlobalKey<FormState>();
  // String Time =DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());
  String? spotname;
  VoidCallback? funct;
  double? time;
  List<String>? spot;
  BooKSpot({super.key, 
    this.funct,
    this.time,
    this.spot,
    this.spotname,
  });
  @override
  State<BooKSpot> createState() => _BooKSpotState();
}

TextEditingController timeinput = TextEditingController();
var time;
//var email=myemail;
String? QRId;
//var QRId;
double? pricee ;
double? hour;

//late String? spotNum = a.spotname;
bool? v;
//Color? n = a.colorofspot;

class _BooKSpotState extends State<BooKSpot> {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    hour = widget.time;
    return ChangeNotifierProvider(
        create: (context) => TotalPrice(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Book Your Spot"),
            // leading: IconButton(
            //     onPressed: () {}, icon: const Icon(Icons.arrow_back)),
          ),
          backgroundColor: const Color(0xffe8ebed),
          body: SingleChildScrollView(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 120, horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Text(
                          " Area: ${widget.spotname}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 25,
                    ),
                    Form(
                      key: formstate,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        decoration: const BoxDecoration(
                            color: Color(0xfff5f8fd),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: TextFormField(
                          // onSaved: (newValue) {
                          //   newValue=NumberOfCar;
                          // },
                          decoration: const InputDecoration(
                            hintText: "Car ID",
                            helperStyle: TextStyle(color: Colors.blue),
                            labelStyle: TextStyle(color: Colors.blue),
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.car_crash_rounded,
                              color: Colors.blue,
                            ),
                          ),
                          onChanged: (v) {
                            QRId = v;
                          },
                          validator: (v) {
                              if (v!.length > 100) {
                                return " email can not be larger than 100 letter";
                              }
                              if (v.length < 2) {
                                return " email name can not be less than 2 letter";
                              }
                              return null;
                            },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // Container(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 15, vertical: 5),
                    //   decoration: const BoxDecoration(
                    //       color: Color(0xfff5f8fd),
                    //       borderRadius:
                    //           BorderRadius.all(Radius.circular(20))),
                    //   child: TextFormField(
                    //       onChanged: (v) {
                    //         // v=NumHour as String;
                    //         setState(() {
                    //           hour = v as double?;
                    //         });
                    //       },
                    //       controller: timeinput,
                    //       decoration: const InputDecoration(
                    //         hintText: "Enter Time",
                    //         border: InputBorder.none,
                    //         prefixIcon: Icon(
                    //           Icons.timer,
                    //           color: Colors.blue,
                    //         ),
                    //       ),
                    //       readOnly:
                    //           true, //set it true, so that user will not able to edit text
                    //       onTap: () async {
                    //         TimeOfDay? pickedTime = await showTimePicker(
                    //             initialTime: TimeOfDay.now(),
                    //             context: context);
                    //         time = pickedTime;
                    //         if (pickedTime != null) {
                    //           print(pickedTime
                    //               .format(context)); //output 10:51 PM
                    //           DateTime parsedTime = DateFormat.Hm().parse(
                    //               pickedTime.format(context).toString());
                    //           //converting to DateTime so that we can further format on different pattern.
                    //           print(
                    //               parsedTime); //output 1970-01-01 22:53:00.000
                    //           String formattedTime =
                    //               DateFormat('HH:mm:ss').format(parsedTime);
                    //           print(formattedTime); //output 14:59:00
                    //           //DateFormat() is from intl package, you can format the time on any pattern you need.

                    //           setState(() {
                    //             timeinput.text =
                    //                 formattedTime; //set the value of text field.
                    //           });
                    //         } else {
                    //           print("Time is not selected");
                    //         }
                    //       }),
                    // ),
                    const SizedBox(height: 15),

                    const SizedBox(
                      height: 80,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.only(left: 20),
                        child: TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Consumer<TotalPrice>(
                                  builder: (context, value, child) {
                                    return TextButton(
                                        onPressed: () {
                                          value.Price();
                                        },
                                        child: Text("Total"));
                                  },
                                  // child: TextButton(onPressed: () {

                                  // }, child: const Text("Total",style: TextStyle(fontSize: 25),textAlign: TextAlign.left,)
                                  // ),
                                ),
                                Consumer<TotalPrice>(
                                    builder: ((context, value, child) {
                                  return Text(value.totalprice.toString());
                                  //  Text(value.totalprice.toString());
                                })),
                              ],
                            )),
                        // child: Consumer<TotalPrice>(builder: (context, value, child) {
                        //   return TextButton(

                        //     onPressed: (){

                        //     Text("${TotalPrice.Price}");

                        //   }, child:const Text("Total",style: TextStyle(fontSize: 25),), );
                        // },),
                        // child: const Text("Total",style: TextStyle(fontSize: 25),),
                      ),
                    ),
                    // const Text("Total",style: TextStyle(fontSize: 25),textAlign: TextAlign.left,)
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                          // ignore: duplicate_ignore
                          onPressed: () async {
                            widget.funct;
                            
                            print(widget.spotname);
                            FirebaseFirestore.instance
                                .collection("Users")
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .collection("History")
                                .add({
                              "Email":
                                  FirebaseAuth.instance.currentUser?.email,
                              "Number of Car": QRId,
                              await "NUM Spot": widget.spotname,
                              //"Start Hour" :StartHour,
                              "NUm Of Hour": hour,
                              "price ": pricee,
                              'timestamp': Time
                            });
                            // ignore: use_build_context_synchronously

                           var formdatt = formstate.currentState;
                           if(formdatt!.validate()){
                             
                            Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => RegisterScreen(
                                            nameofspot: widget.spotname!,
                                          ))));
                                          
                           }
                          },
                          style: ElevatedButton.styleFrom(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30),
                          ),
                          child: Text("BOOK")),
                    )
                  ],
                )),
          ),
        ));
  }
}

class TotalPrice with ChangeNotifier {
  double totalprice = 000.001;

  void Price() {
    totalprice = hour! * 10.00;
    pricee = totalprice;
    notifyListeners();
  }
}
//  TextFormField(
//                     decoration: const InputDecoration(
                     
//                       hintText: "Start Hour",
//                       helperStyle: TextStyle(color:Colors.blue),
//                       labelStyle: TextStyle(color: Colors.blue),
//                       border: InputBorder.none,
//                       prefixIcon: Icon(
//                         Icons.lock_clock,
//                         color: Colors.blue,
//                       ),
//                     ),
                 