import 'package:flutter/material.dart';
import 'package:sambadev/global.dart';
import 'package:sambadev/widgets/widgets.dart';

class StudentSignIn extends StatefulWidget {
  const StudentSignIn({super.key});

  @override
  State<StudentSignIn> createState() => _StudentSignInState();
}

class _StudentSignInState extends State<StudentSignIn> {
  @override
  Widget build(BuildContext context) {
    TextEditingController email=TextEditingController();
    TextEditingController password=TextEditingController();
 
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("Assets/Background-1.png"),
              fit: BoxFit.fitWidth
            ),
          ),
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 150,
              ),
              Image.asset(
                "Assets/Logo.png",
                height: 150,
                width: size.width,
              ),
          
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Etudiant'),
                    Forms(email, 'email'),
                    Forms(password, 'password'),
                    Row(children: [Button(title: 'Submit', onPressed: (){}, backgroundColor: primaryColor,foregnColor: Colors.white,)],
                    )
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
