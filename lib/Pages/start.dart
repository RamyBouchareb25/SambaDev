import 'package:flutter/material.dart';
import 'package:sambadev/global.dart';

class Start extends StatelessWidget {
  const Start({super.key});
  Widget button(String title, Size size) {
    return Column(children: [
      Container(
        height: size.height * 0.125,
        width: size.width * 0.25,
        decoration: BoxDecoration(
            color: primaryColor,  borderRadius: BorderRadius.circular(20)),
        child: const Icon(
          Icons.person,
          color: Colors.white,
        ),
      ),
      Text(title),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("Assets/Background.png"))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "Assets/Logo.png",
              // height: 100,
              // width: 100,
            ),
            const Text(
              "Choose your option",
              style: TextStyle(
                  color: primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  button("Student", size),
                  button("Teacher", size),
                  button("Admin", size),
                  button("Parent", size),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
