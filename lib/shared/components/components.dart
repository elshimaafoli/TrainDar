import 'package:flutter/material.dart';
Widget defaultButton ({
  required Function func,
  required String text,
   double width =double.infinity, }) => SizedBox(
    width: width,
    height: 40.0,
    child: MaterialButton(
      child: Text(
        text,
        style:  const TextStyle(
          fontSize: 20,
        ),
      ),
      onPressed: func(),
      color: const Color.fromRGBO(87, 89, 86, 100),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: const BorderSide(color: Color(0xff707070)),
      ),
    ));