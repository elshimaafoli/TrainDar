import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:traindar_app/data/TrainIDAPI.dart';
import '../../../LocationScreen.dart';
import '../../../swap.dart';
class SearchByID extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _state();
}

class _state extends State<SearchByID> {
  int? selectedID;
  List<int> IDs = [];
  void initState() {
    super.initState();
    _convertFutureListToList();
  }
  void _convertFutureListToList() async {
    IDs = await TrainAPI().getID();
  }
 // List<int> IDs;
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
              size: 30,
            ),
            Text(
              'Search By Train ID',
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
            child: Center(
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.values.last,
                children: [
                  Container(
                    color: const Color.fromRGBO(211, 200, 160, 0.85),
                    child: const Padding(
                      padding: EdgeInsets.all(30),
                      child: Text(
                        "Please, "
                        "Select Your Train ID",
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 90),
                      border: Border.all(
                          color: const Color.fromRGBO(112, 112, 112, 100)),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                      child: DropdownButton<int>(
                        dropdownColor: const Color.fromRGBO(255, 255, 255, 90),
                        hint: const Text("Train ID"),
                        iconSize: 35,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black45,
                          fontStyle: FontStyle.italic,
                        ),
                        elevation: 20,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        items: IDs.map((int value) {
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
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MaterialButton(
                          onPressed: () async {
                            //print(selectedID);
                            var data =
                                await TrainAPI().getLoaction(selectedID as int);

                            Navigator.push(
                                context, Config.route(LocationScreen()));
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
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          color: const Color.fromRGBO(246, 188, 0, 1),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromRGBO(112, 112, 112, 100)),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          child: BottomNavigationBar(
            selectedItemColor: const Color.fromRGBO(87, 89, 86, 1),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.list,
                  ),
                  label: ("")),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.house_rounded,
                  ),
                  label: ("")),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                ),
                label: (""),
              ),
            ],

            // currentIndex: _selectedIndex,
            onTap: (int index) {
              //if(index==2)
              // Navigator.push(context, Config.route(Profile()));
            },
            backgroundColor: const Color.fromRGBO(223, 209, 162, 1),
            iconSize: 44,
            unselectedItemColor: const Color.fromRGBO(87, 89, 86, 1),
          ),
        ),
      ),
    );
  }
}
