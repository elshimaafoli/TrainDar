import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';

class GBS extends StatefulWidget {
  @override
  State<GBS> createState() => _GBSState();
}

class _GBSState extends State<GBS> {
  bool? _serviceEnabled ;
  @override
  void initState(){
    super.initState();
    checkLocationServiceOnDevice();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text(
          "test location"
        ),
      ),
    );
  }
  Future<void> checkLocationServiceOnDevice() async {
    Location location = Location();
    PermissionStatus? _permissionGranted;
      _serviceEnabled = await location.serviceEnabled();
    if (_serviceEnabled!) {
      print("gbs enabled");
      _permissionGranted= await location.hasPermission();
      if(_permissionGranted==PermissionStatus.granted)
        {
          print("hi,before");
          _permissionGranted=PermissionStatus.denied;
        }
      else{
        _permissionGranted=await location.requestPermission();
        if(_permissionGranted==PermissionStatus.granted)
        {
          print("hi");
        }
      }
    }
    else {
    _serviceEnabled=await location.requestService();
      if(_serviceEnabled!)
        {
          print("start tracking");
        }
      else
        {
          SystemNavigator.pop();
        }
    }
  }
}
