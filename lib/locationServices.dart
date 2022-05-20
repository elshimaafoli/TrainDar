import 'package:location/location.dart';
class LocationServices{
  static bool getPermission=false;
Future<LocationData> getLocation () async{
  Location _location= Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _data;
  _serviceEnabled= await _location.serviceEnabled();
  if(!_serviceEnabled) {
    _serviceEnabled=await _location.requestService();
  }
  if(!_serviceEnabled){
    throw Exception("open GBS");
  }

  _permissionGranted=await _location.hasPermission();
  if(_permissionGranted==PermissionStatus.denied||
  _permissionGranted==PermissionStatus.deniedForever){
    _permissionGranted=await _location.requestPermission();
  }
  if(_permissionGranted!=PermissionStatus.granted){
    throw Exception('give me Permission');
  }
  _data=await _location.getLocation();
  getPermission=true;
  return _data;
}
}