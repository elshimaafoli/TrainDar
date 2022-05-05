import 'package:flutter/material.dart';

var corner = const Radius.circular(30.0);

class UserAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("entered");
    return MaterialApp(
        home: Scaffold(
      //rgb(246, 241, 226)
      backgroundColor: const Color.fromRGBO(246, 241, 226, 1),
      body: _buildBody(),
    ));
  }

  _buildIcons(IconData icon) {
    return Icon(
      icon,
      size: 44,
      //rgb(87, 89, 86)
      color: const Color.fromRGBO(87, 89, 86, 1),
    );
  }

  Decoration decorationOfContainer = BoxDecoration(
      border: Border.all(color: const Color.fromRGBO(112, 112, 112, 100)),
      color: const Color.fromRGBO(223, 209, 161, 100),
      borderRadius: BorderRadius.only(topRight: corner, topLeft: corner));

  _buildBody() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            decoration: decorationOfContainer,
            //  boxShadow: [BoxShadow(color: Color.fromARGB(30, 0, 0, 0),blurRadius: 10,spreadRadius: -15)]),
            width: double.infinity,
            height: 90,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildIcons(Icons.settings),
                  _buildIcons(Icons.house_outlined),
                  _buildIcons(Icons.person_pin),
                ])));
  }
}
