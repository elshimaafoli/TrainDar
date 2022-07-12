import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:traindar_app/apis/TrainIDAPI.dart';
import 'package:traindar_app/apis/station_api.dart';
import 'package:traindar_app/layout/home_layout.dart';
import 'package:traindar_app/models/station/close_stations.dart';
import 'package:traindar_app/modules/profile/profile.dart';
import '../../swap.dart';
class NearestStations extends StatefulWidget {
  const NearestStations({Key? key}) : super(key: key);

  @override
  State<NearestStations> createState() => _NearestStationsState();
}

class _NearestStationsState extends State<NearestStations> {
  int? selectedID;
  bool? _showList;
  int currentIndex = 1;
  @override
  void initState() {
    _showList = false;
    super.initState();
  }

  void show() {
    setState(() {
      _showList = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(223, 209, 162, 1),
        foregroundColor: Colors.black,
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
              'Nearest Stations',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
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
        height: MediaQuery.of(context).size.height,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
            child: FutureBuilder<List<int>>(
                future: TrainAPI().getID(),
                builder:
                    (BuildContext context, AsyncSnapshot<List<int>> snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(173, 172, 156, 0.80),
                              border: Border.all(
                                  color:
                                      const Color.fromRGBO(112, 112, 112, 100)),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 20),
                              child: DropdownButton<int>(
                                isExpanded: true,
                                dropdownColor:
                                    const Color.fromRGBO(173, 172, 156, 0.80),
                                hint: Row(
                                  children: const [
                                    Icon(
                                      Icons.directions_train_rounded,
                                    ),
                                    Text("TrainID"),
                                  ],
                                ),
                                iconSize: 25,
                                style: const TextStyle(
                                  fontSize: 17,
                                  color: Colors.black87,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                items: snapshot.data!.map((int value) {
                                  return DropdownMenuItem<int>(
                                    value: value,
                                    child: Text(value.toString()),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedID = value;
                                    print(selectedID);
                                  });
                                },
                                value: selectedID,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: MaterialButton(
                              onPressed: () {
                                show();
                              },
                              highlightColor: Colors.black45,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Text(
                                "Search",
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              color: Colors.amber,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: _showList!,
                          child: FutureBuilder<List<CloseStations>>(
                              future: StationAPI()
                                  .getNearestStations(trainId:selectedID??0),
                              builder: (BuildContext context,
                                  AsyncSnapshot<List<CloseStations>> snapshot) {
                                if (snapshot.hasData) {
                                  if (snapshot.data!.isEmpty) {
                                    return AlertDialog(
                                      backgroundColor: const Color.fromRGBO(
                                          211, 200, 160, 0.85),
                                      title: const Text(
                                          'There is no nearby stations'),
                                      actions: [
                                        MaterialButton(
                                            onPressed: () {
                                              Navigator.push(context,
                                                  Config.route(HomeLayout()));
                                            },
                                            color: const Color.fromRGBO(
                                                246, 188, 0, 1),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: const Text('ok'))
                                      ],
                                    );
                                  } else {
                                    return Center(
                                      child: Container(
                                        alignment: Alignment.topCenter,
                                        padding:
                                            const EdgeInsets.only(top: 20.0),
                                        child: SingleChildScrollView(
                                          child: DataTable(
                                            border: TableBorder.all(
                                                color: Colors.brown,
                                                width: 2,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10))),
                                            decoration: const BoxDecoration(
                                              color: Color.fromRGBO(
                                                  208, 196, 156, 0.75),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                            ),
                                            columns: const [
                                              DataColumn(
                                                  label: Text(
                                                'Stations',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.center,
                                              )),
                                              DataColumn(
                                                  label: Text(
                                                'Remaining Time',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.center,
                                              )),
                                            ],
                                            rows: List.generate(
                                                snapshot.data!.length, (index) {
                                              final name =
                                                  snapshot.data![index].name;
                                              final time = snapshot
                                                  .data![index].timeLeft;
                                              return DataRow(cells: [
                                                DataCell(Text(name)),
                                                DataCell(Text(time)),
                                              ]);
                                            }),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.brown,
                                    ),
                                  );
                                }
                              }),
                        ),
                      ],
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
      bottomNavigationBar:BottomNavigationBar(
        elevation: 20,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        showUnselectedLabels: false,
        backgroundColor: const Color.fromRGBO(223, 209, 164, 1),
        unselectedItemColor: const Color.fromRGBO(87, 89, 86, 1),
        currentIndex: currentIndex,
        onTap: (ind) {
          setState(() {
            currentIndex = ind;
            if(currentIndex==1)
            {
              Navigator.pushReplacement(
                  context,
                  Config.route(HomeLayout()));
            }
            else if(currentIndex==2)
            {
              Navigator.pushReplacement(
                  context,
                  Config.route(Profile()));
            }
          });
        },
        fixedColor: const Color.fromRGBO(87, 89, 86, 0.5),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list_rounded),
            label: "Menu",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.house),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
