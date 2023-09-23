import 'package:flutter/material.dart';
import 'package:sambadev/Pages/cours.dart';
import 'package:sambadev/Pages/emploie_page.dart';
import 'package:sambadev/Pages/home.dart';
import 'package:sambadev/Pages/profile.dart';
import 'package:sambadev/Pages/rooms.dart';
import 'package:sambadev/Pages/ressources.dart';
import 'package:sambadev/global.dart';
import 'package:sambadev/models/auth.dart';
import 'package:sambadev/models/icomoon_icons.dart';

Widget forms(
    {required TextEditingController controller,
    required String label,
    required Function() onChanged,
    required String? Function(String?)? validator}) {
  return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        validator: validator,
        onChanged: (value) {
          onChanged();
        },
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle:
              const TextStyle(color: accentColor), // Optional label color
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: accentColor), // Bottom border color
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
                color: accentColor), // Bottom border color when focused
          ),
        ),
      ));
}

PreferredSizeWidget appBar({required BuildContext context}) {
  return AppBar(
    leading: Image.asset(
      'Assets/Logo-1.png',
      fit: BoxFit.fitHeight, // Set the fit property to control the height
    ),
    actions: [
      const Icon(
        Icomoon.Bell,
        color: primaryColor,
      ),
      const SizedBox(
        width: 30,
      ),
      PopupMenuButton(
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              child: TextButton(
                onPressed: () {
                  Auth().signOut();
                },
                child: const Text('Logout'),
              ),
            )
          ];
        },
        child: const Hero(
          tag: "Profile",
          child: CircleAvatar(
            backgroundImage: AssetImage('Assets/avatar.png'),
          ),
        ),
      ),
      const SizedBox(
        width: 10,
      ),
    ],
  );
}

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.backgroundColor,
      required this.foregnColor,
      this.isloading});
  final String title;
  final Function()? onPressed;
  final Color backgroundColor;
  final foregnColor;
  final bool? isloading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          foregroundColor: foregnColor, backgroundColor: backgroundColor),
      onPressed: onPressed,
      child: isloading == null || !isloading!
          ? Text(title)
          : const CircularProgressIndicator(
              color: Colors.white,
            ),
    );
  }
}

Widget title({required String path}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      children: [
        const Icon(
          Icons.keyboard_arrow_right,
          color: primaryColor,
        ),
        Text(
          path,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: primaryColor),
        )
      ],
    ),
  );
}

Widget bottomNavBar(
    {required int selectedPage, required BuildContext context}) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
    selectedItemColor: primaryColor,
    unselectedItemColor: Colors.grey,
    iconSize: 20,
    items: [
      const BottomNavigationBarItem(
        icon: Icon(Icomoon.Resources),
        label: "Ressources",
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icomoon.Chats),
        label: "Chat",
      ),
      BottomNavigationBarItem(
          icon: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: const Color(0xFF539DF3),
                  borderRadius: BorderRadius.circular(50)),
              child: const Icon(
                Icomoon.News,
                color: Colors.white,
              )),
          label: ''),
      const BottomNavigationBarItem(
        icon: Icon(Icomoon.Time),
        label: "Emploi",
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: "Profile",
      ),
    ],
    currentIndex: selectedPage,
    onTap: (value) {
      switch (value) {
        case 0:
          // Navigator.popUntil(context, (route) => !route.isCurrent);
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => const Home()));
          Navigator.pushReplacement(
              context,
              CustomPageRoute(
                child: const Ressources(),
                axis: AxisDirection.left,
              ));
          break;
        case 1:
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => const Home()));
          Navigator.pushReplacement(
              context,
              CustomPageRoute(
                child: const Rooms(),
                axis: AxisDirection.left,
              ));
          break;
        case 2:
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => const Home()));
          Navigator.pushReplacement(
              context,
              CustomPageRoute(
                child: const Home(),
                axis: AxisDirection.left,
              ));
          break;
        case 3:
          // Navigator.popUntil(context, (route) => !route.isCurrent);
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => const SettingsPage()));
          Navigator.pushReplacement(
              context,
              CustomPageRoute(
                child: const EmploiePage(),
                axis: AxisDirection.left,
              ));
          break;
        case 4:
          // Navigator.popUntil(context, (route) => !route.isCurrent);
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => const SettingsPage()));
          Navigator.pushReplacement(
              context,
              CustomPageRoute(
                child: const Profile(),
                axis: AxisDirection.left,
              ));
          break;
        default:
      }
    },
  );
}

Widget Annoncement(
    String auteur, String contenu, String heure, int groupe, bool isPressed) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
        decoration: BoxDecoration(
            gradient: gradient, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      const Image(image: AssetImage('Assets/avatar.png')),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        children: [
                          Text(auteur),
                          Text(heure),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 50,
                    child: Column(
                      children: [
                        Container(
                            decoration: const BoxDecoration(
                                color: accentColor,
                                borderRadius: BorderRadiusDirectional.all(
                                    Radius.circular(50))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('G$groupe'),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(contenu),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite,
                      color: isPressed ? Colors.red : Colors.grey,
                    )),
                const Icon(Icomoon.Comment),
                const Text('Commentaire'),
                const SizedBox(
                  width: 10,
                )
              ],
            )
          ],
        )),
  );
}

class CustomPageRoute extends PageRouteBuilder {
  CustomPageRoute({required this.child, required this.axis})
      : super(pageBuilder: (context, animation, secondaryAnimation) => child);
  final Widget child;
  final AxisDirection axis;
  Offset _offset(AxisDirection axis) {
    switch (axis) {
      case AxisDirection.up:
        return const Offset(0, -1);
      case AxisDirection.down:
        return const Offset(0, 1);
      case AxisDirection.left:
        return const Offset(-1, 0);
      case AxisDirection.right:
        return const Offset(1, 0);
    }
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      SlideTransition(
          position: Tween<Offset>(
            begin: _offset(axis),
            end: Offset.zero,
          ).animate(animation),
          child: child);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 250);
}

Widget moduleButton(List<String> modules) {
  return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: modules.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                CustomPageRoute(
                  child: Cours(module: modules[index]),
                  axis: AxisDirection.right,
                ));
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(12, 131, 227, 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                modules[index],
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        );
      });
}
