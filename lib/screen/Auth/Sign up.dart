// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, prefer_typing_uninitialized_variables, unused_import, avoid_single_cascade_in_expression_statements, await_only_futures

import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parking_app/screen/home/Home.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'Sign in.dart';
import 'alert.dart';

// String emailAddress = "heshamelsaady329@gmail.com";
// late String password;
// String firstname = "Hesham";
// String lastname = "Elsaady";
// var img;
final FirebaseAuth _auth = FirebaseAuth.instance;
final User? user = _auth.currentUser;
final String uid = user!.uid;

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var firstname, lastname, myPassword, myemail;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  signUp() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: myemail,
          password: myPassword,
        );
        if (credential.user!.emailVerified == false) {
          await FirebaseAuth.instance.currentUser!.sendEmailVerification();
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
  }

  // File? image;
  // Future pickImage() async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if (image == null) return;
  //     final imageTemporary = File(image.path);
  //     setState(() {
  //       this.image = imageTemporary;
  //     });
  //   } on PlatformException catch (e) {
  //     print("Failed to pick image");
  //   }
  // }

  // TextEditingController fNameController = TextEditingController();
  // TextEditingController lNameController = TextEditingController();
  // TextEditingController emController = TextEditingController();
  // TextEditingController PasswordController = TextEditingController();
  // // var fkey = GlobalKey<FormState>();
  // GlobalKey<FormState> fkey = GlobalKey<FormState>();
  // void clearText() {
  //   fNameController.clear();
  //   lNameController.clear();
  //   emController.clear();
  //   PasswordController.clear();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: const Color(0xffe8ebed),
      body: SingleChildScrollView(
          child: Container(
        // height: MediaQuery.of(context).size.height,
        // alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Form(
                child: Column(
                  children: [
                    Stack(
                      children: <Widget>[
                        Positioned(
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                            child: Image.asset(
                              "images/9.png",
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Form(
                      key: formstate,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xffe1e2e3),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ]),
                        child: Column(
                          children: [
                            // CircleAvatar(
                            //     radius: 50,
                            //     // ignore: unnecessary_null_comparison
                            //     child: image != null
                            //         ? Image.file(
                            //             image!,
                            //             width:
                            //                 MediaQuery.of(context).size.width,
                            //             height:
                            //                 MediaQuery.of(context).size.height,
                            //             fit: BoxFit.cover,
                            //           )
                            //         : Text("Choose photo")),
                            // ElevatedButton(
                            //     onPressed: () {},
                            //     child: Text("gallery")),
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                              decoration: const BoxDecoration(
                                  color: Color(0xfff5f8fd),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: "First Name",
                                    border: InputBorder.none),
                                onSaved: (val) {
                                  firstname = val;
                                },
                                validator: (val) {
                                  if (val!.length > 100) {
                                    return " user name can not be larger than 100 letter";
                                  }
                                  if (val.length < 2) {
                                    return " user name can not be less than 2 letter";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                              decoration: const BoxDecoration(
                                  color: Color(0xfff5f8fd),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: "Last Name",
                                    border: InputBorder.none),
                                onSaved: (val) {
                                  lastname = val;
                                },
                                validator: (val) {
                                  if (val!.length > 100) {
                                    return " user name can not be larger than 100 letter";
                                  }
                                  if (val.length < 2) {
                                    return " user name can't be less than 2 letter";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                              decoration: const BoxDecoration(
                                  color: Color(0xfff5f8fd),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    hintText: "Email ",
                                    border: InputBorder.none),
                                onSaved: (val) {
                                  myemail = val;
                                },
                                validator: (val) {
                                  if (val!.length > 100) {
                                    return " email can not be larger than 100 letter";
                                  }
                                  if (val.length < 2) {
                                    return " email name can not be less than 2 letter";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                              decoration: const BoxDecoration(
                                  color: Color(0xfff5f8fd),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: TextFormField(
                                onSaved: (val) {
                                  myPassword = val;
                                },
                                validator: (val) {
                                  if (val!.length > 100) {
                                    return " PW can not be larger than 100 letter";
                                  }
                                  if (val.length < 4) {
                                    return " PW can not be less than 2 letter";
                                  }
                                  return null;
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: " PassWord",
                                    border: InputBorder.none),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                      shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white70),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      elevation: 13,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 55),
                    ),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                    onPressed: () async {
                     // ignore: unused_local_variable
                     UserCredential? response = await signUp();
                      // if (response != null) {
                      final CollectionReference users =
                          FirebaseFirestore.instance.collection('Users');
                      await users.add({
                        "Email":myemail,
                        "First Name":firstname,
                        "Last Name":lastname,
                        'uid': uid,
                        // add any other user data you want to store in the document
                      });
                      //  await FirebaseFirestore.instance.collection("Users").add({
                      // "First Name":firstname,
                      // "Last Name" : lastname,
                      // "Email" : myemail,
                      // "uid" : uid.toString()

                      //  });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const LoginPage())));
                      //print(response.user!.email);
                      //  }
                    },
                  ),

                  const SizedBox(
                    width: 5,
                  ),
                  // InkWell(
                  //   onTap: () async {
                  //     var gogl = await signInWithGoogle();
                  //     if (gogl.user!.emailVerified == true) {
                  //       print(gogl.user);
                  //     } else {
                  //       print("==============================");
                  //     }
                  //   },
                  //   child: Container(
                  //     padding: const EdgeInsets.symmetric(
                  //         horizontal: 10, vertical: 5),
                  //     decoration: const BoxDecoration(
                  //         color: Color(0xfff5f8fd),
                  //         borderRadius: BorderRadius.all(Radius.circular(20)),
                  //         boxShadow: [
                  //           BoxShadow(
                  //               color: Colors.black12,
                  //               offset: Offset(0.0, 18.0),
                  //               blurRadius: 15.0),
                  //           BoxShadow(
                  //             color: Colors.black12,
                  //             offset: Offset(0.0, -04.0),
                  //             blurRadius: 10.0,
                  //           ),
                  //         ]),

                  //     child: Row(
                  //       children: [
                  //         const Text(
                  //           "Sign UP with",
                  //           style: TextStyle(
                  //               fontSize: 14,
                  //               color: Colors.deepPurpleAccent,
                  //               fontWeight: FontWeight.w900),
                  //         ),
                  //         Image.asset(
                  //           "images/images6.png",
                  //           height: 40,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text(
                  "Already have an account?",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoginPage()));
                  },
                  child: Container(
                    child: const Text("Sign In",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.deepPurpleAccent,
                            fontSize: 18)),
                  ),
                )
              ]),
            ],
          ),
        ),
      )),
    );
  }
}
