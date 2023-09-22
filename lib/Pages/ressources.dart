import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sambadev/classes/classes.dart';
import 'package:sambadev/models/auth.dart';
import 'package:sambadev/widgets/widgets.dart';

class Ressources extends StatefulWidget {
  const Ressources({super.key});

  @override
  State<Ressources> createState() => _RessourcesState();
}

class _RessourcesState extends State<Ressources> {
  @override
  Widget build(BuildContext context) {
    BuildContext ctext = context;
    return SafeArea(child:
                     Scaffold(
                      appBar: appBar(context: ctext),
                       body: Container(decoration: const BoxDecoration(
                          color: Color.fromRGBO(56, 125, 191, 0.25),
                          image: DecorationImage(
                                 image: AssetImage("Assets/Background-2.png"),
                                 fit: BoxFit.fitWidth),
                            ),
                       child: moduleButton(modulesInfo[Auth.student!.semestre]!)),
                      bottomNavigationBar: bottomNavBar(selectedPage: 0,context: context), 
                     ));
  }
}