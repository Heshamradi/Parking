// import 'package:auth/utils/color_utils.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:parking_app/screen/Auth/Sign%20up.dart';
import 'package:parking_app/screen/Auth/signinGoogle.dart';
import 'package:parking_app/screen/home/Home.dart';

import 'alert.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var myPassword, myemail;
  GlobalKey<FormState> formstate =  GlobalKey<FormState>();
  signIn() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
//       try {
//   UserCredential usercredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//     email: myemail,
//     password: myPassword
//   );
//   return usercredential;
// } on FirebaseAuthException catch (e) {
//   if (e.code == 'user-not-found') {
//     print('No user found for that email.');
//   } else if (e.code == 'wrong-password') {
//     print('Wrong password provided for that user.');
//   }
// }
      try {
        showLoading(context);

        UserCredential usercredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: myemail.toString().trim(), 
            password: myPassword.toString().trim());
        return usercredential;
      } 
      on FirebaseAuthException catch(e)
      {
          if (e.code == 'user-not-found') {
             Navigator.of(context).pop();
            print('No user found for that email.');
            AwesomeDialog(
                    context: context,
                    title: "Error",
                    body: const Text("No user found for that email"))
                .show();
          } else if (e.code == 'wrong-password') {
            // print('Wrong password provided for that user.');
            AwesomeDialog(
                    context: context,
                    title: "Error",
                    body: const Text("Wrong password provided for that user."))
                .show();
          }
      }
      } else {
        print("Not valid");
      }
  }
  
  // final _emailController = TextEditingController();
  // final _passwordController = TextEditingController();
  // Future signIn()async{
  //   await FirebaseAuth.instance.signInWithEmailAndPassword(
  //     email: _emailController.text.trim(),
  //      password: _passwordController.text.trim());
  // }

  // @override
  // void dispose(){
  //   super.dispose();
  //   _emailController.dispose();
  //   _passwordController.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login ")),
      backgroundColor: const Color(0xffe8ebed),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 70,
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: <Widget>[
                    SizedBox(
                      height: 180,
                      width: 600,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child:
                            Image.asset("images/images8.jpg", fit: BoxFit.fill),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                Form(
                  key: formstate,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffe1e2e3),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 3),
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w800),
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 2, vertical: 5),
                          decoration: const BoxDecoration(
                              color: Color(0xfff5f8fd),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: TextFormField(
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
                            decoration: const InputDecoration(
                              hintText: "Email",
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 2, vertical: 5),
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
                            decoration: const InputDecoration(
                              hintText: " Password ",
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.vpn_key,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                    alignment: Alignment.centerRight,
                    child: Container(
                      child: const Text(
                        "Forgot Password ",
                        style: TextStyle(
                            color: Colors.deepPurpleAccent,
                            fontWeight: FontWeight.w700),
                      ),
                    )),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        elevation: 3,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                        backgroundColor: Colors.deepPurpleAccent,
                        shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white70),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                      ),
                      onPressed: () async {
                        var user = await signIn();
                        if(user!=null){
                        
                        
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Home(),
                          ));}
                  
                      },
                      label: const Text(
                        "Sign In ",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, color: Colors.white),
                      ),
                      icon: const Icon(Icons.login),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () async {
                        UserCredential x = await signInWithGoogle();
                        print(x.user);
                        Navigator.push(context, MaterialPageRoute(builder: 
                        (context) =>const Home() ,));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: const BoxDecoration(
                            color: Color(0xfff5f8fd),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0.0, 18.0),
                                  blurRadius: 15.0),
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0.0, -04.0),
                                  blurRadius: 10.0),
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Sign in with",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.deepPurpleAccent,
                                    fontSize: 15)),
                            Image.asset(
                              'images/images6.png',
                              height: 40,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text("Don't have an account?"),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignUp(),
                      ));
                    },
                    child: Container(
                      child: const Text("Register now",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.deepPurpleAccent)),
                    ),
                  )
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
