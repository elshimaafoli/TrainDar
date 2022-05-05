import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:traindar_app/modules/search_by_trainid/search_by_id/search_by_id.dart';
import 'package:traindar_app/data/TrainIDAPI.dart';
import '../../../swap.dart';
class MessageSearch extends StatelessWidget {
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
              Icons.house,
              size: 30,
            ),
            Text(
              'Search By TrainID',
              style: TextStyle(
                fontSize: 26,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body:Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/backgroundHome.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter:  ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child:  Container(
            decoration:  BoxDecoration(color: Colors.white.withOpacity(0.0)),
            child: AlertDialog(
              elevation:10,
              backgroundColor: const Color.fromRGBO(223, 209, 162, 1),
              title:
              Column(

                children: [
                  const Padding(
                    padding:  EdgeInsets.only(bottom: 8),
                    child:  Icon(
                      Icons.notifications_active_rounded,
                      size: 30,
                    ),
                  ),
                  const Padding(
                    padding:  EdgeInsets.all(8.0),
                    child:  Text(
                      "You will Lose some Points",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8,8,8,0),
                    child: MaterialButton(
                      onPressed:  () async {
                       List<int> IDs= await TrainAPI().getID();
                        Navigator.push(context, Config.route(SearchByID()));
                      },
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:const Text(
                        "Continue",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      color: const Color.fromRGBO(246, 188, 0, 1),
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
          border: Border.all(
              color: const Color.fromRGBO(112, 112, 112, 100)),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30)),
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
            onTap: (int index){
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

