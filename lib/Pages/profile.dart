import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sambadev/global.dart';
import 'package:sambadev/models/auth.dart';
import 'package:sambadev/models/icomoon_icons.dart';
import 'package:sambadev/widgets/widgets.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: appBar(context: context),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(56, 125, 191, 0.25),
          image: DecorationImage(
              image: AssetImage("Assets/Background-2.png"),
              fit: BoxFit.fitWidth),
        ),
        child: Column(children: [
          title(path: "Profile"),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Compte :",
              style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            ),
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("Assets/avatar.png"),
                ),
              ),
              Column(children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Nom : ${Auth.student!.nom}')),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Prenom : ${Auth.student!.prenom}')),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Lieu : ${Auth.student!.ville}')),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Date : ${Auth.student!.dateDeNaissance}')),
              ])
            ],
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Text('Etudes : ${Auth.student!.filiere}')),
          Align(
              alignment: Alignment.centerLeft,
              child: Text('Section : ${Auth.student!.section.toString()}')),
          Align(
              alignment: Alignment.centerLeft,
              child: Text('Groupe : ${Auth.student!.groupe.toString()}')),
          const Row(
            children: [Icon(Icomoon.Card)],
          ),
          const Row(
            children: [Icon(Icomoon.Marks)],
          ),
          const Row(
            children: [Icon(Icomoon.Calc)],
          ),
          const Row(
            children: [Icon(Icomoon.Bac)],
          ),
        ]),
      ),
      bottomNavigationBar: bottomNavBar(selectedPage: 4, context: context),
    ));
  }
}
