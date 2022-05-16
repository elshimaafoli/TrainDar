
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class LocationScreen extends StatefulWidget {
  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    var markers=HashSet<Marker>();
   // Location loc= Location();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(223, 209, 162, 1),
        foregroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Icons.location_on_outlined,
              size: 30,
            ),
            Text(
              'Location',
              style: TextStyle(
                fontSize: 26,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body:    GoogleMap(
        initialCameraPosition:
           const CameraPosition(

              target: LatLng(27.178312,31.185926),
              zoom: 18,
            ),
           onMapCreated: (GoogleMapController googleMapController){
        setState(() {
          markers.add(
           const Marker(
              markerId:MarkerId('1'),
              position:LatLng(27.178312,31.185926),
          ),
          );
        });
           },
        markers: markers,
            ),
    );
  }
}
