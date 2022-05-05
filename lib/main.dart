import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:traindar_app/shared/network/local/local_storage.dart';
import 'gbs.dart';
import 'modules/login/login.dart';
Future<void> main() async {
 // LocalStorage.init();
  runApp( App());
  // UserAPI().getUser();
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),

    );
  }
}

Widget startImage = Container(
    decoration: const BoxDecoration(
  image: DecorationImage(
    image: AssetImage("images/welcome.jpg"),
    fit: BoxFit.cover,
  ),
));

//
