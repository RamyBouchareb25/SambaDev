import 'package:flutter/material.dart';
import 'package:sambadev/Pages/student_signIn.dart';
import 'package:sambadev/Pages/teacherForm.dart';
import 'package:sambadev/global.dart';
import 'package:sambadev/models/custom_page_route.dart';
import 'package:sambadev/models/icomoon_icons.dart';

class Start extends StatelessWidget {
  const Start({super.key});
  Widget button(
      {required String title,
      required Size size,
      required Function() onTap,
      required IconData icon}) {
    return Column(children: [
      InkWell(
        onTap: onTap,
        child: Container(
          height: size.height * 0.125,
          width: size.width * 0.25,
          decoration: BoxDecoration(
              color: primaryColor, borderRadius: BorderRadius.circular(20)),
          child: Icon(
            icon,
            color: Colors.white,
            size: 50,
          ),
        ),
      ),
      Text(
        title,
        style: const TextStyle(fontSize: 18),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image:
                  DecorationImage(image: AssetImage("Assets/Background.png"))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "Assets/Logo.png",
                // height: 100,
                // width: 100,
              ),
              const Text(
                "Choose your option",
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: [
                      button(
                        icon: Icomoon.Student_Male,
                        title: "Student",
                        size: size,
                        onTap: () {
                          Navigator.of(context).push(CustomPageRoute(
                              child: const StudentSignIn(),
                              axis: AxisDirection.right));
                        },
                      ),
                      button(
                        icon: Icomoon.Teacher,
                        title: "Teacher",
                        size: size,
                        onTap: () {
                           Navigator.of(context).push(CustomPageRoute(
                              child: const TeacherForm(),
                              axis: AxisDirection.right));
                        },
                      ),
                      button(
                        icon: Icons.person,
                        title: "Admin",
                        size: size,
                        onTap: () {},
                      ),
                      button(
                        icon: Icomoon.Parent,
                        title: "Parent",
                        size: size,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
