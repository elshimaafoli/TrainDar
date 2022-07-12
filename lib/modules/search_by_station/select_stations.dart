import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:traindar_app/apis/station_api.dart';
import 'package:traindar_app/layout/home_layout.dart';
import 'package:traindar_app/modules/profile/profile.dart';
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
  int currentIndex = 1;
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
              'Search by Stations',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
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
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                color:
                                    const Color.fromRGBO(173, 172, 156, 0.80),
                                border: Border.all(
                                    color: const Color.fromRGBO(
                                        112, 112, 112, 100)),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                              ),
                              child: DropdownButton<String>(
                                isExpanded: true,
                                dropdownColor:
                                    const Color.fromRGBO(173, 172, 156, 0.80),
                                hint: Row(
                                  children: const [
                                    Icon(
                                      Icons.directions_train_rounded,
                                    ),
                                    Text("Start Station"),
                                  ],
                                ),
                                alignment: Alignment.bottomCenter,
                                iconSize: 35,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
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
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                color:
                                    const Color.fromRGBO(173, 172, 156, 0.80),
                                border: Border.all(
                                    color: const Color.fromRGBO(
                                        112, 112, 112, 100)),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                              ),
                              child: DropdownButton<String>(
                                isExpanded: true,
                                dropdownColor:
                                    const Color.fromRGBO(173, 172, 156, 0.80),
                                hint: Row(
                                  children: const [
                                    Icon(
                                      Icons.directions_train_rounded,
                                    ),
                                    Text("Destination"),
                                  ],
                                ),
                                alignment: Alignment.bottomCenter,
                                iconSize: 35,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
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
                            height: 20,
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
                                            selectedValue1, selectedValue2)));
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
                                        fontSize: 17,
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
