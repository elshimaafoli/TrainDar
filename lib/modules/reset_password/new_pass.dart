import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traindar_app/apis/return_password_api.dart';
import 'package:traindar_app/modules/login/login.dart';
import '../profile/profile.dart';
import '../../swap.dart';

final newpass = TextEditingController();
final confirmpass = TextEditingController();
var corner = const Radius.circular(55.0);

class NewPassword extends StatelessWidget {
  //final _NewPass="";
  //final ConfirmPass="";
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      //rgb(223, 209, 162)
      backgroundColor: const Color.fromRGBO(223, 209, 162, 1),
      body: SingleChildScrollView(
        child: Column(children: [
          const Image(
            image: AssetImage("images/forgotPassword.jpg"),
          ),
          Form(
            key: formKey,
            child: Container(
              //design of container ..
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54),
                  borderRadius:
                      BorderRadius.only(topLeft: corner, topRight: corner),
                  color: const Color.fromRGBO(239, 231, 206, 100)),
              width: double.infinity,
              child: Column(
                children: [
//enter new pass
                  Padding(
                    padding: const EdgeInsets.fromLTRB(35, 60, 35, 10),
                    child: Row(
                      children: const [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "New PassWord",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
// input new pass
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 5, bottom: 8),
                      child: TextFormField(
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "You must add a new password";
                          }
                          return null;
                        },
                        obscureText: true,
                        controller: newpass,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color.fromRGBO(255, 255, 255, 90),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 0,
                                color: Color.fromRGBO(255, 255, 255, 90)),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 0,
                                color: Color.fromRGBO(255, 255, 255, 90)),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                        ),
                      ),
                    ),
                  ),
//enter confirm pass
                  Padding(
                    padding: const EdgeInsets.fromLTRB(35, 20, 35, 10),
                    child: Row(
                      children: const [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Confirm Password",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
//input confirm pass
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 5),
                      child: TextFormField(
                        style: const TextStyle(fontSize: 20),
                        controller: confirmpass,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "You must add a confirm password";
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color.fromRGBO(255, 255, 255, 90),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 0,
                                color: Color.fromRGBO(255, 255, 255, 90)),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 0,
                                color: Color.fromRGBO(255, 255, 255, 90)),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10, right: 40),
                        child: MaterialButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              if (newpass.value == confirmpass.value) {
                                if (await ReturnPass()
                                    .NewPassword(newpass.text)) {
                                  Navigator.push(context, Config.route(Login()));
                                }
                                else{
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "please, Enter  a valid Password.",
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      duration: Duration(seconds: 2),
                                      width: double
                                          .infinity, // Width of the SnackBar.
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                        8.0, // Inner padding for SnackBar content.
                                      ),
                                      behavior: SnackBarBehavior.floating,
                                    ),);

                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "please, Enter  a valid Password.",
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      duration: Duration(seconds: 2),
                                      width: double
                                          .infinity, // Width of the SnackBar.
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                        8.0, // Inner padding for SnackBar content.
                                      ),
                                      behavior: SnackBarBehavior.floating,
                                    ),);

                              }
                            }
                          },
                          child: const SizedBox(
                            height: 40,
                            child: Center(
                              child: Text(
                                "Restore",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          color: const Color.fromRGBO(87, 89, 86, 100),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: const BorderSide(color: Color(0xff707070)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    ));
  }
}
