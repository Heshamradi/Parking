import 'package:flutter/material.dart';
import 'package:parking_app/Views/Spots/Spot_A.dart';
import 'package:parking_app/Views/Spots/Spot_B.dart';
import 'package:parking_app/Views/Spots/Spot_C.dart';
// ignore: unused_import
import '../../Booking/Book_spot.dart';

class ParkingSpotsScreen extends StatelessWidget {
  const ParkingSpotsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parking Spots'),
      ),
       body:  Container(child: Padding(
        padding: const EdgeInsets.only(top: 60, left: 20, right: 20, ),
        child: GridView(
        
          
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 30,
          crossAxisSpacing: 30),
        
          
          children: <Widget>[
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const Spot_A()));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.purple,),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
              Icon(Icons.car_crash_outlined,size: 80,color: Colors.white,),
              // ignore: prefer_const_constructors
              Text("Spot A",style: TextStyle(color: Colors.white,fontSize: 30),)
            ],),
            ),
          ),
         InkWell(
             onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const SpotB()));
            },
           child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.purple,),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              
              // ignore: prefer_const_literals_to_create_immutables
              children: [
              Icon(Icons.car_crash,size: 80,color: Colors.white,),
              Text("Spot B ",style: TextStyle(color: Colors.white,fontSize: 30),)
            ],),
            ),
         ),
          InkWell(
              onTap: (){

              Navigator.push(context, MaterialPageRoute(builder: (context)=>const Spot_C()));

            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.purple,),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(Icons.car_crash,size: 80,color: Colors.white,),
              Text("Spot C",style: TextStyle(color: Colors.white,fontSize: 30),)
            ],),
            ),
          ),
          InkWell(
              onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const Spot_A()));
            },
            child: Container(
              padding: const EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                 color: Colors.purple,
                ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Image.asset("images/disabled.png",fit: BoxFit.cover,height: 90,width: 100,),
                const SizedBox(height: 5,),
                const Text("Spot ",style: TextStyle(color: Colors.black,fontSize: 30),)
            ],),
            ),
          ),
        ],
        ),
      ),),
    );
  }
}
// GridView.count(
//         childAspectRatio: (100 / 40),
//         //physics: NeverScrollableScrollPhysics(),
//         padding: EdgeInsets.all(10),
//         crossAxisCount: 2, // number of columns
//         crossAxisSpacing: 50,
//         mainAxisSpacing: 20,
        
//         shrinkWrap: true,
//         //physics:ScrollPhysics(),
//         scrollDirection: Axis.vertical,
//         children: List.generate(
//           4, // total number of parking spots
//           (index) => ElevatedButton(
//             onPressed: () {
//               //Navigator.push(context, MaterialPageRoute(builder: ((context) => BooKSpot())));
//             },
//             child: Container(
//               //margin: EdgeInsets.all(1),
//               // decoration: BoxDecoration(
//               //   color: Colors.white60,
//               //   borderRadius: BorderRadius.circular(8),
//               // ),
//               child: Center(
//                 child: Text(
//                   'Spot ${index + 1}',
//                   style: TextStyle(fontSize: 25),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
