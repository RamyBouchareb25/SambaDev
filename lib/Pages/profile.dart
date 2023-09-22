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
                  
                 ]),
                 bottomNavigationBar: bottomNavBar(selectedPage: 4, context: context),
                 ));
  }
}