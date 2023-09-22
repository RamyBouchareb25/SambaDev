import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
    return SafeArea(child: Scaffold(
                 appBar: appBar(context: context),
                 body: Column(children: [
                  Text('>Profile'),
                  Row(children: [Image(image: AssetImage('Assets/avatar.png')),
                       Column(children: [
                        Row(
                         children: [
                           Text('Nom'),
                           Text(Auth.student!.nom),

                         ],
                       ),
                       
                          Row(
                         children: [
                           Text('Prenom'),
                           Text(Auth.student!.prenom),

                         ],
                       ),
                        Row(
                         children: [
                           Text('Lieu'),
                           Text(Auth.student!.ville),
                         ],
                       ),
                        Row(
                         children: [
                           Text('Date'),
                           Text(Auth.student!.dateDeNaissance),

                         ],
                       ),                
                       ],)],
                       ),
                       Row(children: [Text('Etudes'),
                                      Text(Auth.student!.filiere)
                       ],),
                       Row(children: [Text('Section'),
                                      Text(Auth.student!.section.toString()),
                       ],),
                       Row(children: [Text('Groupe'),
                                      Text(Auth.student!.groupe.toString())
                       ],),
                       Row(children: [Icon(Icomoon.Card)],),
                       Row(children: [Icon(Icomoon.Marks)],),
                       Row(children: [Icon(Icomoon.Calc)],),
                       Row(children: [Icon(Icomoon.Bac)],),
                 ]),
                 bottomNavigationBar: bottomNavBar(selectedPage: 4, context: context),
                 ));
  }
}