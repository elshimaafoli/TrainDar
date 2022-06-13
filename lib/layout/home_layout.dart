import 'package:flutter/material.dart';

import 'package:traindar_app/modules/home/home.dart';
import 'package:traindar_app/modules/profile/profile.dart';


class HomeLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<HomeLayout> {
  @override
  int currentIndex = 1;
  List<Widget> screens =[];
  void initState() {
    super.initState();
     screens= [const Text(''), const HomeScreen(), Profile()];
  }



  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(223, 209, 164, 0.85),
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromRGBO(112, 112, 112, 100)),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          child: BottomNavigationBar(

            elevation: 20,
            type: BottomNavigationBarType.fixed,
            iconSize: 35,
            showUnselectedLabels: false,
            backgroundColor: const Color.fromRGBO(223, 209, 164, 1),
            unselectedItemColor: const Color.fromRGBO(87, 89, 86, 1),
            currentIndex: currentIndex,
            onTap: (ind) {
              setState(() {
                currentIndex = ind;
                print(ind);
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
        ),
      ),
    );
  }
}
