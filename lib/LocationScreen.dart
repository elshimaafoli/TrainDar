
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
class LocationScreen extends StatefulWidget {
  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    var markers=HashSet<Marker>();
    Location loc= Location();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(223, 209, 162, 1),
        foregroundColor: Colors.black,
        leading:IconButton(
          alignment: Alignment.topLeft,
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
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
            Marker(
              markerId:MarkerId('1'),
              position:LatLng(27.178312,31.185926),
          ),
          );
        });
           },
        markers: markers,
            ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: const Color.fromRGBO(112, 112, 112, 100)),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30)),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          child: BottomNavigationBar(

            selectedItemColor: const Color.fromRGBO(87, 89, 86, 1),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.list,
                  ),
                  label: ("")),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.house_rounded,
                  ),
                  label: ("")),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                ),
                label: (""),
              ),

            ],

            // currentIndex: _selectedIndex,
            onTap: (int index){
              //if(index==2)
              // Navigator.push(context, Config.route(Profile()));
            },
            backgroundColor: const Color.fromRGBO(223, 209, 162, 1),
            iconSize: 44,
            unselectedItemColor: const Color.fromRGBO(87, 89, 86, 1),
          ),
        ),
      ),
    );
  }
}
