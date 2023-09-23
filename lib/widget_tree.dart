import 'package:sambadev/Pages/home.dart';
import 'package:sambadev/Pages/start.dart';
import 'package:sambadev/classes/classes.dart';
import 'package:sambadev/models/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});
  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (Auth().currentUser != null) {
      FirebaseFirestore.instance
          .collection("Etudiants")
          .where("uid", isEqualTo: Auth().currentUser!.uid)
          .get()
          .then((value) {
        Etudiant? etudiant;
        if (value.docs.isNotEmpty) {
          for (var element in value.docs) {
            etudiant = Etudiant.fromMap(element.data());
          }
        }
        Auth.student = etudiant;
      });
    }
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            return const Home();
          } else {
            return const Start();
          }
        } else {
          return Scaffold(
            body: Center(
              child: Image.asset("Assets/Logo.png"),
            ),
          );
        }
      },
    );
  }
}
