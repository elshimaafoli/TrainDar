import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:traindar_app/models/station/station.dart';
import '../uris.dart';

class StationAPI {

  List <String> Stations = <String>[];
  Future <List<String>> getStation()async{
   var response= await http.get(
       Uri.parse(URI.getNameStations),
     headers: URI.headers,
   );
   var body=jsonDecode(response.body);
   for (var item in body){
     Stations.add(Station.fromJson(item).name);
   }
   return Stations.toList();
  }
}