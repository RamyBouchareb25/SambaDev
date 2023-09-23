import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TeacherForm extends StatefulWidget {
  const TeacherForm({super.key});

  @override
  State<TeacherForm> createState() => _TeacherFormState();
}

class _TeacherFormState extends State<TeacherForm> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
         Scaffold(body: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(56, 125, 191, 0.25),
          image: DecorationImage(
              image: AssetImage("Assets/step1.png"),
              fit: BoxFit.fitWidth),
        ),
         ),));
  }
}