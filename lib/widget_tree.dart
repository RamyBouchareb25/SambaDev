import 'package:sambadev/Pages/home.dart';
import 'package:sambadev/Pages/start.dart';
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
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            FirebaseFirestore.instance
                .collection("Users")
                .where("UserId", isEqualTo: Auth().currentUser!.uid)
                .get()
                .then((value) {
              for (var element in value.docs) {
                FirebaseFirestore.instance
                    .collection("Users")
                    .doc(element.id)
                    .update({"Status": "online"});
              }
            });
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
