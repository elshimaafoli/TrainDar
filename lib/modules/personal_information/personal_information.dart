
import 'package:flutter/material.dart';
import '../profile/profile.dart';
import '../../swap.dart';

class PersonalInformation extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
      return _state();
  }
}

class _state extends State<PersonalInformation> {

  @override

  Widget build(BuildContext context) {
   // return MaterialApp(
   //   home: Scaffold(
   //        backgroundColor: const Color.fromRGBO(223, 209, 162, 1),
   //        appBar: AppBar(
   //          shape: const RoundedRectangleBorder(
   //              borderRadius: BorderRadius.horizontal(
   //                  left: Radius.circular(20), right: Radius.circular(20))
   //          ),
   //          leading: const Icon (Icons.article_rounded,
   //            size: 44,
   //            color: Colors.red,),
   //          title: const Text("Personal Information",
   //            style: TextStyle(
   //              fontSize: 30,
   //              fontWeight: FontWeight.bold,
   //              color: Color.fromRGBO(87, 89, 86, 50),
   //            ),
   //
   //          ),
   //          backgroundColor: const Color.fromRGBO(246, 241, 226, 1),
   //        ),
   //        body: Data(),
   //      ),
   // )
    return personal;
  }
}

Widget personal = Scaffold(
  backgroundColor: const Color.fromRGBO(242, 238, 225,1),
  appBar: AppBar(
    backgroundColor: const Color.fromRGBO(223, 209, 162,0.9),
    title: const Text(
      'Personal Information',
      style: TextStyle(
        fontSize:30,
        color: Colors.black,
      ),
    ),
    leading: const Icon(
      Icons.format_indent_decrease_outlined,
      color: Colors.red,
      size: 30,
    ),
  ),
);

  class Data extends StatelessWidget
  {
  @override
  Widget build(BuildContext context) {
    return Stack(
     children : [
      Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration:  BoxDecoration(
          border: Border.all(color: Colors.black54),
          borderRadius: const BorderRadius.all( Radius.circular(30)),
          color: const Color.fromRGBO(246, 241, 226, 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:  [
            //name
           Padding(
             padding: const EdgeInsets.only(left :12.0),
             child: Row(
               children: const[
                 Text("Name :",
                 style: TextStyle(fontSize: 25,
                   fontWeight: FontWeight.bold,
                   color: Color.fromRGBO(0, 0, 0, 80),
                 ),),
                 Text(""),
               ],
             ),
           ),
            Container(
              color: Colors.black54,
              height: 0.5,
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: const EdgeInsets.only(left :8.0),
              child: Row(
                children: const[
                  Text("Email :",
                    style: TextStyle(fontSize: 25,
                    fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(0, 0, 0, 80),
                    ),),
                  Text(""),
                ],
              ),
            ),
            Container(
              color: Colors.black54,
              height: 0.5,
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: const EdgeInsets.only(left :8.0),
              child: Row(
                children: const[
                  Text("Phone :",
                    style: TextStyle(fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(0, 0, 0, 80),
                    ),),
                  Text(""),
                ],
              ),
            ),
            Container(
              color: Colors.black54,
              height: 0.5,
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: const EdgeInsets.only(left :8.0),
              child: Row(
                children: const[
                  Text("BirthDate :",
                    style: TextStyle(fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(0, 0, 0, 80),
                    ),),
                  Text(""),
                ],
              ),
            ),
            Container(
              color: Colors.black54,
              height: 0.5,
              width: MediaQuery.of(context).size.width*0.9,
            ),
            Padding(
              padding: const EdgeInsets.only(left :8.0),
              child: Row(
                children: const[
                  Text("Coins :",
                    style: TextStyle(fontSize: 25,
                      fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(0, 0, 0, 80),
                    ),),
                  Text(""),
                ],
              ),
            ),

          ],
        ),
      ),
    ),
       Align(
         alignment: Alignment.topRight,
         child :Padding(
           padding: const EdgeInsets.only(top:8,right:15),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
               TextButton(
                 onPressed: () {
                   //Navigator.push(context, Config.route(Login()));
                 },
                 child: const Text(
                   "Edit",
                   style: TextStyle(
                     fontSize: 25,
                     color: Colors.black54,
                     fontWeight: FontWeight.bold,
                     fontFamily: 'Railway',
                   ),
                 ),
                 style: TextButton.styleFrom(
                   minimumSize: Size.zero,
                   padding: EdgeInsets.zero,
                 ),
               ),
             ],
           ),
         ),
       ),
    ]);
  }

  }
