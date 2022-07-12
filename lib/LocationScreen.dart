import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'locationServices.dart';

class LocationScreen extends StatefulWidget {

  double location_lat = 0.0;
  double location_lng = 0.0;
  LocationScreen(this.location_lat, this.location_lng, {Key? key})
      : super(key: key);
  @override
  State<LocationScreen> createState() =>
      _LocationScreenState(location_lat, location_lng);
}

class _LocationScreenState extends State<LocationScreen> {
  double location_lat = 0.0;
  double location_lng = 0.0;

  _LocationScreenState(this.location_lat, this.location_lng);

  final Set<Marker> _markers = {};
  final Completer<GoogleMapController> _controller = Completer();
  //late var _locationIcon;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_BuildMarker();
  }

  @override
  Widget build(BuildContext context) {
    final CameraPosition _pos = CameraPosition(
        target: LatLng(location_lat, location_lng), zoom: 16.4767);
    LatLng currentPosition = _pos.target;
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
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _pos,
        //register for controller
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          setState(() {
            _setMarker(_pos.target);
          });
        },
        onCameraMove: (newposition) {
          setState(() {
            currentPosition = newposition.target;
          });
        },
        markers: _markers,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getmyLocation();
        },
        child: const Icon(Icons.gps_fixed),
        backgroundColor: Colors.brown,
      ),
      bottomNavigationBar: Container(
        height: 25,
        alignment: Alignment.center,
        color: const Color.fromRGBO(223, 209, 162, 1),
        child: Text("lat: ${currentPosition.latitude}  "
            "lng: ${currentPosition.longitude}"),
      ),
    );
  }

  Future<void> _getmyLocation() async {
    LocationData _data = await LocationServices().getLocation();
    _animateCamera(_data);
  }
  Future<void> _animateCamera(LocationData _loc) async {
    final GoogleMapController controller = await _controller.future;
    CameraPosition _cameraPosition = CameraPosition(
        target: LatLng(_loc.latitude!, _loc.longitude!), zoom: 17.4767);
    controller.animateCamera(CameraUpdate.newCameraPosition(_cameraPosition));
  }
  Future<void> _setMarker(LatLng _locat) async {
    Marker newMarker = Marker(
        markerId: (MarkerId(_locat.toString())),
        icon: BitmapDescriptor.defaultMarker,
        position: _locat,
        infoWindow: const InfoWindow(
          title: "current train",
        ));
    _markers.add(newMarker);
    setState(() {});
  }
}

// Future<void> _BuildMarker() async {
//   BitmapDescriptor  _locationIcon = await BitmapDescriptor.fromAssetImage(
//         ImageConfiguration(size: Size(48, 48)), 'images/markTrain.jpg');
// }
