import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:traindar_app/apis/station_api.dart';
import 'package:traindar_app/models/train/nearby_trains.dart';

class ListIDTrains extends StatelessWidget {
  String? station1 = "default";
  String? station2 = "default";
  ListIDTrains(this.station1, this.station2);
  @override
  Widget build(BuildContext context) {
    print(station1);
    print(station2);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(223, 209, 162, 1),
        foregroundColor: const Color.fromRGBO(90, 89, 100, 1),
        title: Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: ImageIcon(
                AssetImage("images/searchCityIcon.png"),
                size: 33,
              ),
            ),
            Text(
              'Search by Stations',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/backgroundHome.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
            child: FutureBuilder<List<NearbyTrains>>(
                future: StationAPI()
                    .getNearbyTrains(station1: station1!, station2: station2!),
                builder: (BuildContext context,
                    AsyncSnapshot<List<NearbyTrains>> snapshot) {
                  if (snapshot.hasData) {
                    for (var item in snapshot.data!) {
                      print(item.trainId);
                    }
                    return Center(
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(208, 196, 156, 0.75),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                ),
                              ),
                              columns: const [
                                DataColumn(
                                    label: Text(
                                  'TrainID',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                )),
                                DataColumn(
                                    label: Text(
                                  'Remaining Time',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                )),
                              ],
                              rows:
                                  List.generate(snapshot.data!.length, (index) {
                                final x =
                                    snapshot.data![index].trainId.toString();
                                final y = snapshot.data![index].timeLeft;

                                return DataRow(cells: [
                                  DataCell(MaterialButton(onPressed: (){},child:Text(x))),
                                  DataCell(MaterialButton(onPressed: (){},child:Text(x))),
                                ]);
                              }),
                            ),
                          ),
                        ),
                      ]),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.brown,
                      ),
                    );
                  }
                }),
          ),
        ),
      ),
    );
  }
}

builditem() => TableRow(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(208, 196, 156, 0.75),
        ),
        children: [
          MaterialButton(
            height: 30,
            padding: const EdgeInsets.all(8.0),
            onPressed: () {},
            child: const Text(
              "TrainID",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ),
          MaterialButton(
            height: 30,
            padding: const EdgeInsets.all(8.0),
            onPressed: () {},
            child: const Text(
              "Time",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ),
        ]);
