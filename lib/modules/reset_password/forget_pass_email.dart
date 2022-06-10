import 'package:flutter/material.dart';
import 'package:traindar_app/apis/return_password_api.dart';
import 'package:traindar_app/modules/reset_password/forget_pass_confirm.dart';
import '../../swap.dart';

var corner = const Radius.circular(55.0);

class ForgetPasswordEmail extends StatelessWidget {
  var emailConfirm = TextEditingController();
  var keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //rgb(223, 209, 162)
      backgroundColor: const Color.fromRGBO(223, 209, 162, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              children: [
            Stack(
              children :const [
              Image(
                image: AssetImage("images/forgotPassword.jpg"),
              ),
          ]),
            Container(
              //design of container ..
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54),
                  borderRadius:
                      BorderRadius.only(topLeft: corner, topRight: corner),
                  color: const Color.fromRGBO(239, 231, 206, 100)),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Column(
                children: [
//enter your email
                  Padding(
                    padding: const EdgeInsets.fromLTRB(35, 60, 35, 10),
                    child: Row(
                      children: const [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Enter your Email",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Icon(
                              Icons.edit,
                              size: 25,
                              color: Colors.black87,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  // input email label
                  Form(
                    key: keyForm,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 5, bottom: 8),
                      child: TextFormField(
                        controller: emailConfirm,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "please, Enter Your Email.";
                          }
                          return null;
                        },
                        style: const TextStyle(fontSize: 20),
                        keyboardType: TextInputType.emailAddress,
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
                        padding: const EdgeInsets.only(top: 40, right: 40),
                        child: MaterialButton(
                          onPressed: () async {
                            if (keyForm.currentState!.validate()) {
                              if (await ReturnPass()
                                  .getCode(emailConfirm.text)) {
                                Navigator.push(
                                    context, Config.route(ForgetPassConfirm()));
                              }
                              else
                                {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "please, Enter  a valid email.",
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
                                    ),
                                  );
                                }
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Continue",
                              style: TextStyle(
                                fontSize: 25,
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
          ]),
        ),
      ),
    );
  }
}
