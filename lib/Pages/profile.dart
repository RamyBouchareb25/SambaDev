import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
                           Text('Leghrib'),

                         ],
                       ),
                        Row(
                         children: [
                           Text('Nom'),
                           Text('Leghrib'),

                         ],
                       ),
                          Row(
                         children: [
                           Text('Prenom'),
                           Text('Rami'),

                         ],
                       ),
                        Row(
                         children: [
                           Text('Lieu'),
                           Text('Ain Benian'),
                         ],
                       ),                
                       ],)],)
                 ]),
                 bottomNavigationBar: bottomNavBar(selectedPage: 4, context: context),
                 ));
  }
}