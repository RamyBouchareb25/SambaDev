import 'package:flutter/material.dart';
import 'package:sambadev/widgets/widgets.dart';

class Cours extends StatefulWidget {
  const Cours({super.key, required this.module});
  final String module;

  @override
  State<Cours> createState() => _CoursState();
}

class _CoursState extends State<Cours> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context),
      body: Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(56, 125, 191, 0.25),
            image: DecorationImage(
                image: AssetImage("Assets/Background-2.png"),
                fit: BoxFit.fitWidth),
          ),
          child: Column(
            children: [
              title(path: "Resources/${widget.module}"),
            ],
          )),
      bottomNavigationBar: bottomNavBar(selectedPage: 0, context: context),
    );
  }
}
