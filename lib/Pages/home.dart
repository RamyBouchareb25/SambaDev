import 'package:flutter/material.dart';
import 'package:sambadev/widgets/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    BuildContext ctext = context;
    return SafeArea(
        child: Scaffold(
      appBar: appBar(context: ctext),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(56, 125, 191, 0.25),
          image: DecorationImage(
              image: AssetImage("Assets/Background-2.png"),
              fit: BoxFit.fitWidth),
        ),
        child: Column(
          children: [
            title(path: "Announcements"),
            Annoncement(
                'Rami',
                'En raison de circonstances exceptionnelles, notre cours se déroulera en ligne cette fois-ci. le cour sera le 24 novembre a 15:00',
                '14:30',
                3,
                false),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavBar(selectedPage: 2, context: context),
    ));
  }
}
