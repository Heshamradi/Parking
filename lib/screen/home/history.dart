import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:parking_app/screen/home/Home.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
         leading: IconButton(
                 onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                                builder: (context)=>const Home()));
                 }, icon: const Icon(Icons.arrow_back))
      ),
      
      body:FutureBuilder(
         future: FirebaseFirestore.instance
         .collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).collection("History")
         .get(),
         builder: ((context, AsyncSnapshot snapshot) {
       if (snapshot.hasData) {
         return ListView.builder(
           itemCount: snapshot.data.docs.length,
           itemBuilder: (context, index) {
             return Container(
              //alignment: Alignment.topLeft,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.purple,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ]),
              
             // color: Colors.amber,
             // padding: const EdgeInsets.all(10),
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   
                   Text(
                     "Email: ${snapshot.data.docs[index].data()["Email"]}",
                     style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
                     ),
                      Text(
                     "Number of Car: ${snapshot.data.docs[index].data()["Number of Car"]}",
                     style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
                     ),
                      Text(
                     "NUM Spot: ${snapshot.data.docs[index].data()["NUM Spot"]}",
                     style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
                     ),
                      Text(
                     "NUm Of Hour: ${snapshot.data.docs[index].data()["NUm Of Hour"]}",
                     style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
                     ),
                      Text(
                     "Pricee: ${snapshot.data.docs[index].data()["price "]}",
                     style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
                     ),
                     Text(
                     "timestamp: ${snapshot.data.docs[index].data()["timestamp"]}",
                     style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
                     ),
                   const SizedBox(height: 15,)
                 ],
               ),
             );
           },
         );
       }
       return const Text("loading");
         }),
       ),
    );
  }
}
//
//       body:  Container(
//         margin: EdgeInsets.all(20),
//         child:FutureBuilder(
//         future: FirebaseFirestore.instance.collection("Users").doc("QZkrUrhKLhYqfTYCXEiH")
//         .collection('History')
//          .get(),
//         builder:((context, AsyncSnapshot snapshot){ 
//         if(snapshot.hasData){ 
          
//           return ListView.builder(
//             itemCount: snapshot.data.docs.length,
//             itemBuilder: (context, index) {
//               return  Text("${snapshot.data.docs[index].data()}",
//                   style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),);
                    
                     
                
              
              
            
//           },);

//         } 
//         return Text("loading");
        
//       }) ,)
//         ),
//         );
//   }
// }
      