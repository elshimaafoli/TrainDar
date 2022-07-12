import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:traindar_app/apis/userAPI.dart';
import 'package:traindar_app/models/users/user.dart';

import 'package:traindar_app/modules/personal_information/personal_information.dart';
import '../../swap.dart';

// _buildIcons(IconData icon) {
//   return Icon(
//     icon,
//     size: 44,
//     //rgb(87, 89, 86)
//     color: const Color.fromRGBO(87, 89, 86, 1),
//   );
// }

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(223, 209, 162, 1),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/profile.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
              child: FutureBuilder<User>(
                  future: UserAPI().getData(UserAPI.currentUserId),
                  builder:
                      (BuildContext context, AsyncSnapshot<User> snapshot) {
                    if (snapshot.hasData) {
                      return SafeArea(
                          child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Stack(
                                children: [
                                  const Align(
                                    alignment: Alignment.topCenter,
                                    child: CircleAvatar(
                                      backgroundImage:
                                          AssetImage('images/user.png'),
                                      radius: 120,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, right: 15.0),
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: PopupMenuButton(
                                        itemBuilder: (context) => [
                                          PopupMenuItem(
                                              child: Row(
                                            children: const [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(right: 8.0),
                                                child: Icon(Icons
                                                    .photo_camera_outlined),
                                              ),
                                              Text("Change photo"),
                                            ],
                                          )),
                                          PopupMenuItem(
                                              child: Row(
                                            children: const [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(right: 8.0),
                                                child: Icon(Icons.edit),
                                              ),
                                              Text("Edit"),
                                            ],
                                          )),
                                          PopupMenuItem(
                                              child: Row(
                                            children: const [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(right: 8.0),
                                                child: Icon(Icons.logout),
                                              ),
                                              Text("Log Out"),
                                            ],
                                          )),
                                        ],
                                        child: const Icon(
                                          Icons.edit,
                                          color: Colors.white70,
                                          size: 25,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                snapshot.data!.name,
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Row(children: const [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      "Credibility :",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "65%",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  )
                                ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  color:const Color.fromRGBO(223, 209, 162, 0.5),
                                  child: ListTile(
                                    leading: const Icon(
                                      Icons.format_indent_decrease_outlined,
                                      color: Colors.red,
                                      size: 25,
                                    ),
                                    title: const Text(
                                      "Personal information",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onTap: () {
                                      Navigator.push(context,
                                          Config.route(PersonalInformation()));
                                    },
                                    trailing: const Icon(
                                      Icons.keyboard_arrow_right_outlined,
                                      size: 30,
                                    ),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      //side: BorderSide(color: Colors.black87),
                                    ),
                                    tileColor: Colors.brown,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  color:const Color.fromRGBO(223, 209, 162, 0.5),
                                  child: ListTile(
                                    leading: const Icon(
                                      Icons.monetization_on,
                                      size: 25,
                                      color: Colors.yellowAccent,
                                    ),
                                    title: const Text(
                                      "Points history",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onTap: () {},
                                    trailing: const Icon(
                                        Icons.keyboard_arrow_right_outlined,
                                        size: 30),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    tileColor: Colors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  color:const Color.fromRGBO(223, 209, 162, 0.5),
                                  child: ListTile(
                                    leading: const Icon(
                                      Icons.person_add,
                                      color: Colors.brown,
                                      size: 18,
                                    ),
                                    title: const Text(
                                      "Invite People",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onTap: () {},
                                    trailing: const Icon(
                                      Icons.keyboard_arrow_right_outlined,
                                      size: 30,
                                    ),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      //side: BorderSide(color: Colors.black87),
                                    ),
                                    tileColor: Colors.white,
                                  ),
                                ),
                              ),
                            ]),
                          ],
                        ),
                      ));
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
      ),
    );
  }
}
