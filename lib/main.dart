import 'package:flutter/material.dart';
import 'modules/login/login.dart';
void main()=>runApp(App());
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