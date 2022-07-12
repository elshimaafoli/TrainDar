import "package:flutter/material.dart";
import 'package:traindar_app/apis/userAPI.dart';
import 'package:traindar_app/modules/login/login.dart';
import '../../models/users/user.dart';
import '../../swap.dart';

var days = [
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '10',
  '11',
  '12',
  '13',
  '14',
  '15',
  '16',
  '17',
  '18',
  '19',
  '20',
  '21',
  '22',
  '23',
  '24',
  '25',
  '26',
  '27',
  '28',
  '29',
  '30',
  '31',

];
var months = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  "Dec"
];
var year = [
  '1986',
  '1987',
  '1988',
  '1989',
  '1990',
  '1991',
  '1992',
  '1993',
  '1994',
  '1995',
  '1996',
  '1997',
  '1998',
  '1999',
  '2000',
  '2001',
  '2002',
  '2003',
  '2004',
  '2005',
  '2006',
  '2007',
  '2008',
];

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}

class _state extends State<SignUp> {
  String dropdownValue1 = '1';
  String dropdownValue2 = 'Jan';
  String dropdownValue3 = '1997';

  var name = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();
  var newPass = TextEditingController();
  var confirmPass = TextEditingController();
  var validPass = TextEditingController();
  @override
// void initState(){
//     UserAPI().createUser(email.text, password.text, phone.text, name.text);
//   }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(223, 209, 162, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 4,
                width: double.infinity,
                child: Stack(alignment: Alignment.topLeft, children: [
                  const Center(
                    child: Image(
                      image: AssetImage("images/joinUs.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(context, Config.route(Login()));
                      },
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        size: 30,
                      ),
                    ),
                  ),
                ]),
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.only(topRight: Radius.circular(60)),
                  border: Border.all(color: Colors.black54),
                  color: const Color.fromRGBO(239, 231, 206, 1),
                ),
                child: ListView(
                  primary: false,
                  shrinkWrap: true,
                  //to build all widgets in listview
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          " Create account     ",
                          style: TextStyle(
                            wordSpacing: 2,
                            fontSize: 25,
                            backgroundColor: Color.fromRGBO(87, 89, 86, 0.7),
                            color: Color.fromRGBO(239, 231, 206, 1),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 15, left: 12),
                          child: Text(
                            "Name",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xff575956),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 15, bottom: 8),
                          child: TextFormField(
                            controller: name,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color.fromRGBO(255, 255, 255, 90),
                              prefixIcon: Icon(Icons.account_circle,
                                  color: Color.fromRGBO(0, 0, 0, 90), size: 30),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0,
                                    color: Color.fromRGBO(255, 255, 255, 90)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0,
                                    color: Color.fromRGBO(255, 255, 255, 90)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //*EmailAddress
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 15, left: 12),
                          child: Text(
                            "Email address",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xff575956),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 15, bottom: 8),
                          child: TextFormField(
                            controller: email,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color.fromRGBO(255, 255, 255, 90),
                              prefixIcon: Icon(Icons.email_rounded,
                                  color: Color.fromRGBO(0, 0, 0, 90), size: 30),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0,
                                    color: Color.fromRGBO(255, 255, 255, 90)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0,
                                    color: Color.fromRGBO(255, 255, 255, 90)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //*phoneNumber
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 15, left: 12),
                          child: Text(
                            "Phone number",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xff575956),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 15, bottom: 8),
                          child: TextFormField(
                            controller: phone,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color.fromRGBO(255, 255, 255, 90),
                              prefixIcon: Icon(Icons.phone_outlined,
                                  color: Color.fromRGBO(0, 0, 0, 90), size: 30),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0,
                                    color: Color.fromRGBO(255, 255, 255, 90)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0,
                                    color: Color.fromRGBO(255, 255, 255, 90)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //*password
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 15, left: 12),
                          child: Text(
                            "Password",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xff575956),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 15, bottom: 8),
                          child: TextFormField(
                            controller: newPass,
                            obscureText: true,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color.fromRGBO(255, 255, 255, 90),
                              prefixIcon: Icon(Icons.lock,
                                  color: Color.fromRGBO(0, 0, 0, 90), size: 30),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0,
                                    color: Color.fromRGBO(255, 255, 255, 90)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0,
                                    color: Color.fromRGBO(255, 255, 255, 90)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //*confirmPassword
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 15, left: 12),
                          child: Text(
                            "Confirm password",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xff575956),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 15, bottom: 8),
                          child: TextFormField(
                            controller: confirmPass,
                            obscureText: true,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color.fromRGBO(255, 255, 255, 90),
                              prefixIcon: Icon(Icons.lock,
                                  color: Color.fromRGBO(0, 0, 0, 90), size: 30),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0,
                                    color: Color.fromRGBO(255, 255, 255, 90)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0,
                                    color: Color.fromRGBO(255, 255, 255, 90)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //*day*month*year
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 15, left: 12),
                              child: Text(
                                "Day",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff575956),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8, left: 12),
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromRGBO(255, 255, 255, 90),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: DropdownButton<String>(
                                    elevation: 16,
                                    //style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    icon: const Icon(Icons.arrow_drop_down),
                                    onChanged: (String? value) {
                                      setState(() {
                                        dropdownValue1 = value!;
                                      });
                                    },
                                    value: dropdownValue1,
                                    items: days.map<DropdownMenuItem<String>>(
                                        (String value2) {
                                      return DropdownMenuItem<String>(
                                        value: value2,
                                        child: Text(value2),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 15, left: 12),
                              child: Text(
                                "month",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff575956),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8, left: 12),
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromRGBO(255, 255, 255, 90),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: DropdownButton<String>(
                                    elevation: 16,
                                    //style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    icon: const Icon(Icons.arrow_drop_down),
                                    onChanged: (String? value) {
                                      setState(() {
                                        dropdownValue2 = value!;
                                      });
                                    },
                                    value: dropdownValue2,
                                    items: months.map<DropdownMenuItem<String>>(
                                        (String value2) {
                                      return DropdownMenuItem<String>(
                                        value: value2,
                                        child: Text(value2),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 15, left: 12),
                              child: Text(
                                "year",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff575956),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8, left: 12),
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromRGBO(255, 255, 255, 90),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: DropdownButton<String>(
                                    elevation: 16,
                                    //style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    icon: const Icon(Icons.arrow_drop_down),
                                    onChanged: (String? value) {
                                      //print(value);
                                      //print("*****************************************************");
                                      setState(() {
                                        dropdownValue3 = value!;
                                      });
                                    },
                                    value: dropdownValue3,
                                    items: year.map<DropdownMenuItem<String>>(
                                        (String value2) {
                                      return DropdownMenuItem<String>(
                                        value: value2,
                                        child: Text(value2),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    //signup button
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, top: 10, bottom: 10),
                      child: SizedBox(
                          width: double.infinity,
                          child: MaterialButton(
                            onPressed: () async {
                              if (newPass.value != confirmPass.value) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    action: SnackBarAction(
                                      label: 'Undo',
                                      onPressed: () {
                                        // Code to execute.
                                      },
                                    ),
                                    content: const Text(
                                      "two passwords aren't same..",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    duration: const Duration(seconds: 2),
                                    width: double
                                        .infinity, // Width of the SnackBar.
                                    padding: const EdgeInsets.symmetric(
                                      horizontal:
                                          8.0, // Inner padding for SnackBar content.
                                    ),
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                              } else {
                                validPass = newPass;
                                var body = userToJson(User(
                                    id: 0,
                                    email: email.text,
                                    password: validPass.text,
                                    phone: phone.text,
                                    name: name.text));
                                bool check =
                                    await UserAPI().createUser(body: body);
                                if (check) {
                                  Navigator.push(
                                    context,
                                    Config.route(Login()),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      action: SnackBarAction(
                                        label: 'Undo',
                                        onPressed: () {
                                          // Code to execute.
                                        },
                                      ),
                                      content: const Text(
                                        "This Account is exist ..",
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      duration: const Duration(seconds: 2),
                                      width: double
                                          .infinity, // Width of the SnackBar.
                                      padding: const EdgeInsets.symmetric(
                                        horizontal:
                                            8.0, // Inner padding for SnackBar content.
                                      ),
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                }
                                //  print(UserAPI().UserEmail);}
                              }
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            color: const Color.fromRGBO(87, 89, 86, 100),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: const BorderSide(color: Color(0xff707070)),
                            ),
                          )),
                    ),
// i already have account
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, Config.route(Login()));
                      },
                      child: const Text(
                        "I already have an account...",
                        textAlign: TextAlign.center,
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
