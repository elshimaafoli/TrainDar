import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:traindar_app/apis/station_api.dart';

import '../../swap.dart';
import 'list_id_time_trains.dart';

class SelectStations extends StatefulWidget {
  @override
  State<SelectStations> createState() => _SelectStationsState();
}

//hello
class _SelectStationsState extends State<SelectStations> {
  String? selectedValue1;
  String? selectedValue2;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(223, 209, 162, 1),
        foregroundColor: const Color.fromRGBO(90, 89, 120, 1),
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
            child: FutureBuilder<List<String>>(
                future: StationAPI().getStation(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<String>> snapshot) {
                  if (snapshot.hasData) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 255, 255, 0.8),
                              border: Border.all(
                                  color: const Color.fromRGBO(74, 59, 42, 1)),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                              child: DropdownButton<String>(
                                dropdownColor:
                                    const Color.fromRGBO(255, 255, 255, 90),
                                hint: const Text("Station"),
                                iconSize: 35,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black45,
                                  fontStyle: FontStyle.italic,
                                ),
                                elevation: 20,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(30)),
                                value: selectedValue1,
                                items: snapshot.data!.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedValue1 = newValue!;
                                  });
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 255, 255, 0.8),
                              border: Border.all(
                                  color: const Color.fromRGBO(74, 59, 42, 1)),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                              child: DropdownButton<String>(
                                dropdownColor:
                                    const Color.fromRGBO(255, 255, 255, 90),
                                hint: const Text("Destination"),
                                iconSize: 35,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black45,
                                  fontStyle: FontStyle.italic,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(30)),
                                value: selectedValue2,
                                items: snapshot.data!.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedValue2 = newValue!;
                                  });
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        Config.route(ListIDTrains(
                                            selectedValue1,
                                            selectedValue2)));
                                  },
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      "Search",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  color: const Color.fromRGBO(246, 188, 0, 1),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
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
