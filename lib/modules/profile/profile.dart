
import 'package:flutter/material.dart';
import 'package:traindar_app/bottomBar.dart';
import 'package:traindar_app/modules/personal_information/personal_information.dart';
import '../../swap.dart';

_buildIcons(IconData icon) {
  return Icon(
    icon,
    size: 44,
    //rgb(87, 89, 86)
    color: const Color.fromRGBO(87, 89, 86, 1),
  );
}

class Profile extends StatelessWidget {
  String name="sh";
  Profile(this.name);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(223, 209, 162, 1),
        body: SafeArea(
            child:SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Stack(
                  children: [
                    const Align(
                      alignment: Alignment.topCenter,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/user.png'),
                        radius: 120,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0,right:15.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: PopupMenuButton(
                          itemBuilder: (context) =>
                          [
                            PopupMenuItem(
                                child: Row(
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Icon(Icons.photo_camera_outlined),
                                    ),
                                    Text("Change photo"),
                                  ],
                                )),
                            PopupMenuItem(
                                child: Row(
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Icon(Icons.edit),
                                    ),
                                    Text("Edit"),
                                  ],
                                )),
                            PopupMenuItem(
                                child: Row(
                                  children: const [

                                    Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Icon(Icons.logout),
                                    ),
                                    Text("Log Out"),
                                  ],
                                )),
                          ],
                          child :const Icon(Icons.edit,
                            color: Colors.white70,
                            size :25,
                          ),

                        ),
                      ),
                    ),
                  ],
                ),
              ),


               Padding(
                padding:  EdgeInsets.all(8.0),
                child: Text(
                  name,
                  style:const  TextStyle (
                    fontSize: 25,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox( height : 20),
              Container(
                height:  MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                    borderRadius:
                    BorderRadius.only(topLeft: corner, topRight: corner),
                    color: const Color.fromRGBO(239, 231, 206, 0.5)),
                width: double.infinity,
                // height: MediaQuery.of(context).size.height*0.6,
                child: Column(
                    children :[
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Row(
                            children:const [
                              Expanded(
                                flex: 2,
                                child: Text("Credibility :",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Text("65%",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),)
                            ]
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListTile(
                            leading: const Icon(
                              Icons.format_indent_decrease_outlined,
                              color: Colors.red,
                              size: 25,
                            ),
                            title: const Text("Personal information",
                              style:TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            onTap: () {
                              Navigator.push(context, Config.route(PersonalInformation()));
                            },
                            trailing: const Icon(Icons.keyboard_arrow_right_outlined,
                              size: 30,),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              //side: BorderSide(color: Colors.black87),
                            ),
                            tileColor: Colors.white,

                          ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListTile(
                          leading: const Icon(Icons.monetization_on,
                            size: 25,
                            color: Colors.yellowAccent,),
                          title: const Text("Points history",
                            style:TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          onTap: () {},
                          trailing: const Icon(Icons.keyboard_arrow_right_outlined,
                              size:30),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            // side: BorderSide(color: Colors.black87),
                          ),
                          tileColor: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListTile(
                          leading: const Icon(Icons.person_add,
                            color: Colors.brown,
                            size: 25,),
                          title: const Text("Invite People",
                            style:TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          onTap: () {},
                          trailing: const Icon(Icons.keyboard_arrow_right_outlined,
                            size: 30,),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            //side: BorderSide(color: Colors.black87),
                          ),
                          tileColor: Colors.white,
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        )),
      ),
    );
  }
}


