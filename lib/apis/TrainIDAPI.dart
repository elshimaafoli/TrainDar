import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:traindar_app/models/train/train.dart';
import '../uris.dart';

class TrainAPI {
  List<int> trainsID = <int>[];
  Future<List<int>> getID() async {
    final response = await http.get(
      Uri.parse(URI.getTrainId),
      headers: URI.headers,
    );

    var body = jsonDecode(response.body);
    for (var item in body) {
      trainsID.add(item);
    }
    for (var item in trainsID) {
      print(item);
    }
    return trainsID.toList();
  }

  Future <TrainModel> getLoaction (int id) async {
    final response = await http.get(
      Uri.parse(URI.getTrainLocation+"$id"),
      headers: URI.headers,
    );
    TrainModel trainModel = TrainModel(id: id);
    var body = json.decode(response.body);
    trainModel.locationLng=TrainModel.locationFromJson(body).locationLng;
    trainModel.locationLat=TrainModel.locationFromJson(body).locationLat;
    print(trainModel.locationLat);
    return trainModel;
  }
}
