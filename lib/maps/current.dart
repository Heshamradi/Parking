import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// ignore: unused_import
import 'dart:ui' as ui;

class GetPoly extends StatefulWidget {
  const GetPoly({super.key});

  @override
  State<GetPoly> createState() => _GetPolyState();
}

class _GetPolyState extends State<GetPoly> {
  final List<LatLng> polylineCoordinates = [
    const LatLng(29.97273276094186, 30.94393928057071),
    const LatLng(29.99622022746595, 30.965874710576287),
    const LatLng(29.971319828339507, 31.019479967079004),
    const LatLng(30.055581627204386, 31.233901438246356),
    const LatLng(30.04998774568307, 30.976864510670765),
    // LatLng(37.774966, -122.417509),
    // LatLng(37.774996, -122.417061),
    // LatLng(37.77503, -122.416583),
    // LatLng(37.77506, -122.416097),
    // LatLng(37.77509, -122.415629),
    // LatLng(37.775123, -122.415163),
  ];
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  void initSate() {
    addCustomIcon();
    super.initState();
  }

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(const ImageConfiguration(), "images/images 3.png")
        .then(
      (icon) {
        setState(() {
          markerIcon = icon;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map"),
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(30.055581627204386,
              31.233901438246356), // set your starting location
          zoom: 10, // set the zoom level
        ),
        markers: <Marker>{
          // ignore: prefer_const_constructors
          Marker(
              markerId: const MarkerId('marker_1'),
              position: const LatLng(29.99622022746595, 30.965874710576287),
              infoWindow: const InfoWindow(title: "Mall Of Arabia Parking")),
          const Marker(
              markerId: MarkerId("mark2"),
              position: LatLng(30.04998774568307, 30.976864510670765),
              infoWindow: InfoWindow(title: "Mall of Arabia Parking")),
          Marker(
              markerId: const MarkerId("mark3"),
              position: const LatLng(29.97273276094186, 30.94393928057071),
              infoWindow: const InfoWindow(title: "AL Hosry Parking "),
              icon: markerIcon),
          const Marker(
              markerId: MarkerId("mark4"),
              position: LatLng(30.055581627204386, 31.233901438246356),
              infoWindow: InfoWindow(title: "Zayed Parking ")),
        },
        polylines: <Polyline>{
          Polyline(
            polylineId: const PolylineId('polyline_1'),
            color: Colors.red,
            width: 6,
            points: polylineCoordinates,
          ),
        },
      ),
    );
  }
}
