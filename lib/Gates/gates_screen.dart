import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app/Views/Home_spot/Spots.dart';

class GatesScreen extends StatelessWidget {
  const GatesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title:  Text("Gates",style: GoogleFonts.ubuntu(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),),
      ),

      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 30,left: 20,right: 20),
        child: Column(
          children: [
            InkWell(
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ParkingSpotsScreen(1)));
              } ,

              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child:Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(70),topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                          gradient: const LinearGradient(
                              begin: Alignment.center,
                              end: Alignment.topLeft,
                              colors: [Colors.deepPurple,Colors.black87]
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20,top: 5),
                          child: Row(
                            children: [
                              Text(
                                'Gate-1',style: GoogleFonts.cairo(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Icon(CupertinoIcons.right_chevron,color: Colors.white,size: 30,),
                              SizedBox(width: 35,),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ) ,
                ),
              ),
            ),
            SizedBox(height: 50,),
            InkWell(
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ParkingSpotsScreen(2)));
              } ,

              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child:Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(70),topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                          gradient: const LinearGradient(
                              begin: Alignment.center,
                              end: Alignment.topLeft,
                              colors: [Colors.deepPurple,Colors.black87]
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20,top: 5),
                          child: Row(
                            children: [
                              Text(
                                'Gate-2',style: GoogleFonts.cairo(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Icon(CupertinoIcons.right_chevron,color: Colors.white,size: 30,),
                              SizedBox(width: 35,),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ) ,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
