import 'package:flutter/material.dart';
import 'package:sambadev/widgets/widgets.dart';

class EmploiePage extends StatefulWidget {
  static const String routeName = '/emploie';

  const EmploiePage({super.key});

  @override
  _EmploiePageState createState() => _EmploiePageState();
}

class _EmploiePageState extends State<EmploiePage> {
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
            title(path: "Emploie"),
            
          ],
        ),
      ),
      bottomNavigationBar: bottomNavBar(selectedPage: 3, context: context),
    );
  }
}
