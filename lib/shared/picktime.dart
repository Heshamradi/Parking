import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_app/Booking/Book_spot.dart';
// ignore: prefer_typing_uninitialized_variables
var timerightnows;
class BoxPage extends StatefulWidget {
  final String spot;
  final String locationspot;
  
  const BoxPage({super.key, 
    required this.locationspot,
    required this.spot,
  });

  @override
  // ignore: library_private_types_in_public_api
  _BoxPageState createState() => _BoxPageState();
}

class _BoxPageState extends State<BoxPage> {
  final List<Box> _boxes = [
    Box(name: 'From 9 to 10 AM', timeSlot: 'T1', isSelected: false),
    Box(name: 'From 10 to 11 AM', timeSlot: 'T2', isSelected: false),
    Box(name: 'From 11 to 12 PM', timeSlot: 'T3', isSelected: false),
    Box(name: 'From 12 to 1 PM', timeSlot: 'T4', isSelected: false),
    Box(name: 'From 1 to 2 PM', timeSlot: 'T5', isSelected: false),
    Box(name: 'From 2 to 3 PM', timeSlot: 'T6', isSelected: false),
    Box(name: 'From 3 to 4 PM', timeSlot: 'T7', isSelected: false),
    Box(name: 'From 4 to 5 PM', timeSlot: 'T8', isSelected: false),
    Box(name: 'From 5 to 6 PM', timeSlot: 'T9', isSelected: false),
    Box(name: 'From 6 to 7 PM', timeSlot: 'T10', isSelected: false),
    Box(name: 'From 7 to 8 PM', timeSlot: 'T11', isSelected: false),
    Box(name: 'From 8 to 9 PM', timeSlot: 'T12', isSelected: false),
  ];
  double hours = 0;
  int _selectedCount = 0;

  Future<List<Box>> _fetchSpotData() async {
    final spotsRef = FirebaseFirestore.instance.collection(widget.locationspot);
    final doc = spotsRef.doc(widget.spot);
    bool dataExists = false;

    while (!dataExists) {
      final snapshot = await doc.get();
      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>;
        for (var box in _boxes) {
          if (data[box.timeSlot] == true) {
            box.isSelected = true;
            _selectedCount++;
          }
        }
        dataExists = true;
      } else {
        await doc.set({
          'T1': false,
          'T2': false,
          'T3': false,
          'T4': false,
          'T5': false,
          'T6': false,
          'T7': false,
          'T8': false,
          'T9': false,
          'T10': false,
          'T11': false,
          'T12': false,
        });
      }
    }
    return _boxes;
  }


  List names =[];
  void _onBoxSelected(bool selected, int index) {
    setState(() {
      if (selected) {
        _selectedCount++;
        hours++;
        names.add(_boxes[index].timeSlot);
        print(names);
      } else {
        _selectedCount--;
        names.remove(_boxes[index].timeSlot);
      }
      _boxes[index].isSelected = selected;
      if (selected == false) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Booking Confirmation'),
            content: Text(
                'Time ${_boxes[index].name} is unavailble try another time '),
            actions: [
              ElevatedButton(
                onPressed: () {
                  timerightnows = DateTime.now();
                  Navigator.pop(context);
                },
                child: const Text('Ok'),
              )
            ],
          ),
        );
      }
    });
  }
  void saveSelectedBoxes() async {
    final spotsRef = FirebaseFirestore.instance.collection(widget.locationspot);
    final doc = spotsRef.doc(widget.spot);
    Map<String, dynamic> data = {};
    for (var box in _boxes) {
      data[box.timeSlot] = box.isSelected;
    }
    await doc.update(data);
  }
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
          color: Colors.deepPurple,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title:  Text("Select Time Slots",style: GoogleFonts.ubuntu(
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple.shade600,
        ),),
      ),
      body: FutureBuilder<List<Box>>(
        future: _fetchSpotData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return GridView.builder(
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemCount: _boxes.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _onBoxSelected(!_boxes[index].isSelected, index);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: _boxes[index].isSelected
                          ? Colors.green
                          : Colors.grey.shade200,
                    ),
                    child: Center(
                      child: Text(
                        _boxes[index].name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: _boxes[index].isSelected
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        saveSelectedBoxes();
          if(hours!=0){
            Navigator.push(context,MaterialPageRoute(builder: ((context) =>BooKSpot(time: hours,spotname: widget.spot,funct: saveSelectedBoxes,list: names,location: widget.locationspot,))));
          }
        },
        backgroundColor: _selectedCount > 0 ? Colors.green : Colors.grey,
        child: const Icon(Icons.check),
      ),
    );
  }
}

class Box {
  final String name;
  final String timeSlot;
  bool isSelected;

  Box({
    required this.name,
    required this.timeSlot,
    required this.isSelected,
  });
}
