import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:traindar_app/apis/TrainIDAPI.dart';
import 'package:traindar_app/layout/home_layout.dart';
import 'package:traindar_app/models/train/train.dart';
import 'package:traindar_app/modules/profile/profile.dart';
import '../../LocationScreen.dart';
import '../../swap.dart';

class SearchByID extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _state();
}

class _state extends State<SearchByID> {
  int? selectedID;
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(223, 209, 162, 1),
        foregroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Icons.search_rounded,
              size: 25,
            ),
            Text(
              'Search By Train ID',
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
            child: FutureBuilder<List<int>>(
                future: TrainAPI().getID(),
                builder:
                    (BuildContext context, AsyncSnapshot<List<int>> snapshot) {
                  if (snapshot.hasData) {
                    return Center(
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin:
                                const EdgeInsets.only(left: 20.0, right: 20),
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            color: const Color.fromRGBO(211, 200, 160, 0.85),
                            child: const Text(
                              "Please, "
                              "Select Your Train ID",
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20),
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
                                  alignment: Alignment.bottomCenter,
                                  iconSize: 25,
                                  style: const TextStyle(
                                    fontSize:16,
                                    color: Colors.black87,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30)),
                                  items: snapshot.data!.map((int value) {
                                    return DropdownMenuItem<int>(
                                      value: value,
                                      child: Text(value.toString()),
                                    );
                                  }).toList(),
                                  onChanged: (newval) {
                                    setState(() {
                                      selectedID = newval;
                                    });
                                  },
                                  value: selectedID,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 50.0, right: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                MaterialButton(
                                  onPressed: () async {
                                    //print(selectedID);
                                    TrainModel train = await TrainAPI()
                                        .getLoaction(selectedID as int);
                                    if (train.id == 0) {
                                      setState(() {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: const Text(
                                              "Sorry, you don't have enough points",
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                            backgroundColor:
                                                const Color.fromRGBO(
                                                    211, 200, 160, 0.85),
                                            duration:
                                                const Duration(seconds: 10),
                                            padding: const EdgeInsets.all(10),
                                            action: SnackBarAction(
                                                label: 'Undo',
                                                textColor: Colors.black,
                                                onPressed: () {}),
                                          ),
                                        );
                                      });
                                      Navigator.push(
                                          context, Config.route(HomeLayout()));
                                    } else {
                                      Navigator.push(
                                          context,
                                          Config.route(LocationScreen(
                                              train.locationLat,
                                              train.locationLng)));
                                    }
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
