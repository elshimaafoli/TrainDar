import 'package:flutter/material.dart';
import 'package:traindar_app/apis/userAPI.dart';
import 'package:traindar_app/layout/home_layout.dart';
import '../reset_password/forget_pass_email.dart';
import '../signup/signup.dart';
import '../../swap.dart';

var corner = const Radius.circular(55.0);

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var email = TextEditingController();
  var password = TextEditingController();
  var keyForm = GlobalKey<FormState>();
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(223, 209, 162, 1),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: keyForm,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.42,
                    child: const Image(
                      image: AssetImage("images/trackMe.jpg"),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black54),
                        borderRadius: BorderRadius.only(
                            topLeft: corner, topRight: corner),
                        color: const Color.fromRGBO(239, 231, 206, 100)),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.55,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          //signin text
                          const Text(
                            "Sign in",
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
//usernameField
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 12, right: 12, top: 15, bottom: 8),
                              child: TextFormField(
                                controller: email,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Email must not be empty";
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  filled: true,
                                  labelStyle: TextStyle(
                                    color: Color.fromRGBO(87, 89, 86, 0.85),
                                  ),
                                  label: Text(
                                    "Email",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  fillColor: Color.fromRGBO(255, 255, 255, 0.6),
                                  prefixIcon: Icon(Icons.person,
                                      size: 30,
                                      color: Color.fromRGBO(87, 89, 86, 0.85)),
                                  //hintText: "Email",
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1,
                                        color:
                                            Color.fromRGBO(87, 89, 86, 0.85)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.brown),
                                    gapPadding: 10,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                ),
                              ),
                            ),
                          ),
//passwordField
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 12, right: 12, top: 8),
                              child: TextFormField(
                                obscureText: showPassword,
                                controller: password,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Password must not be empty";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      const Color.fromRGBO(255, 255, 255, 0.6),
                                  prefixIcon: const Icon(Icons.lock,
                                      size: 30,
                                      color: Color.fromRGBO(87, 89, 86, 0.85)),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (showPassword) {
                                          showPassword = false;
                                        } else {
                                          showPassword = true;
                                        }
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.remove_red_eye_outlined,
                                      size: 26,
                                    ),
                                    color:
                                        const Color.fromRGBO(87, 89, 86, 0.85),
                                  ),
                                  labelStyle: const TextStyle(
                                    color: Color.fromRGBO(87, 89, 86, 0.85),
                                  ),
                                  label: const Text(
                                    "Password",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1,
                                        color:
                                            Color.fromRGBO(87, 89, 86, 0.85)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1,
                                        color:
                                            Color.fromRGBO(87, 89, 86, 0.85)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                ),
                              ),
                            ),
                          ),

//forgetPassword button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(context,
                                        Config.route(ForgetPasswordEmail()));
                                  },
                                  child: const Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Railway',
                                    ),
                                  ),
                                  style: TextButton.styleFrom(
                                    minimumSize: Size.zero,
                                    padding: EdgeInsets.zero,
                                  ),
                                ),
                              ),
                            ],
                          ),

//sign in button
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: SizedBox(
                                width: double.infinity,
                                child: MaterialButton(
                                  height: 50,
                                  onPressed: () async {
                                    if (keyForm.currentState!.validate()) {
                                      if (await UserAPI().loginUser(
                                          email.text, password.text)) {

                                        Navigator.push(
                                            context,
                                            Config.route(
                                                HomeLayout()));
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              "wrong email or password.",
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
                                  child: const Text(
                                    "Sign in",
                                    style: TextStyle(
                                      fontSize: 22,
                                    ),
                                  ),
                                  color: const Color.fromRGBO(87, 89, 86, 100),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    side: const BorderSide(
                                        color: Color(0xff707070)),
                                  ),
                                )),
                          ),
//gmail button
//                   Padding(
//                     padding: const EdgeInsets.only(left: 10, right: 10),
//                     child: SizedBox(
//                         width: double.infinity,
//                         child: MaterialButton(
//                           onPressed: () {},
//                           child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: const [
//                                 Text(
//                                   "Sign in with Gmail",
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(
//                                     left: 15,
//                                   ),
//                                   child: Icon(Icons.email_rounded,
//                                       color: Colors.red, size: 25),
//                                 ),
//                               ]),
//                           color: const Color.fromRGBO(87, 89, 86, 100),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30),
//                             side: const BorderSide(color: Color(0xff707070)),
//                           ),
//                         )),
//                   ),

// line..or..line
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    color: Colors.black54,
                                    height: 1,
                                  ),
                                ),
                                const Expanded(
                                    flex: 1,
                                    child: Center(
                                        child: Text(
                                      "or",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ))),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    color: Colors.black54,
                                    height: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
// i dont have account
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, Config.route(SignUp()));
                            },
                            child: const Text(
                              "You don't have an account ?",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black45,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Railway',
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
