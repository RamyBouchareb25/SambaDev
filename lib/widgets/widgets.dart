import 'package:flutter/material.dart';
import 'package:sambadev/global.dart';

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
      Icon(Icons.notifications),
      SizedBox(
        width: 30,
      ),
      Icon(Icons.person)
    ],
  );
}

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.backgroundColor,
      required this.foregnColor});
  final String title;
  final Function()? onPressed;
  final Color backgroundColor;
  final foregnColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          foregroundColor: foregnColor, backgroundColor: backgroundColor),
      onPressed: onPressed,
      child: Text(title),
    );
  }
}

// Widget bottomNavBar({selectedPage, required BuildContext context}) {
//   return BottomNavigationBar(
//     type: BottomNavigationBarType.fixed,
//     backgroundColor: Colors.white,
//     selectedItemColor: primaryColor,
//     unselectedItemColor: Colors.grey,
//     iconSize: 20,
//     items:  [
//       BottomNavigationBarItem(
//         icon: Icon(Icons.),
//         label: "Chats",
//       ),
//       BottomNavigationBarItem(
//         icon: Icon(Icons.),
//         label: "Calls",
//       ),
//        BottomNavigationBarItem(
//         icon: ,
//         label: "People",
//       ),
//       BottomNavigationBarItem(
//         icon: ,
//         label: "People",
//       ),
//       BottomNavigationBarItem(
//         icon: Icon(Icomoon.Settings),
//         label: "Settings",
//       ),
//     ],
//     currentIndex: selectedPage,
//     onTap: (value) {
//       switch (value) {
//         case 0:
//           // Navigator.popUntil(context, (route) => !route.isCurrent);
//           // Navigator.push(
//           //     context, MaterialPageRoute(builder: (context) => const Home()));
//           Navigator.pushReplacement(
//               context,
//               CustomPageRoute(
//                 child: const Home(),
//                 axis: AxisDirection.left,
//               ));
//           break;
//         case 1:
//           // Navigator.push(
//           //     context, MaterialPageRoute(builder: (context) => const Home()));
//           break;
//         case 2:
//           // Navigator.push(
//           //     context, MaterialPageRoute(builder: (context) => const Home()));
//           break;
//         case 3:
//           // Navigator.popUntil(context, (route) => !route.isCurrent);
//           // Navigator.push(context,
//           //     MaterialPageRoute(builder: (context) => const SettingsPage()));
//           Navigator.pushReplacement(
//               context,
//               CustomPageRoute(
//                 child: const SettingsPage(),
//                 axis: AxisDirection.right,
//               ));
//           break;
//         default:
//       }
//     },
//   );
// }
Widget Annoncement(
    String auteur, String contenu, String heure, int groupe, String section) {
  return Container(
    decoration: BoxDecoration(gradient: LinearGradient(colors: [accentColor,primaryColor])),
      child: Column(
    children: [
      Row(
        children: [
          Image(image: AssetImage('Assets/avatar.png')),
          Column(
            children: [
              Text(auteur),
              Text(heure),
            ],
          ),
          Container(
            width: 50,
            child: Column(
              children: [Container(
                            decoration: BoxDecoration(
                              color: accentColor,
                              borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(5),topEnd: Radius.circular(5))),
                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Text(section),
                           )), 
                           SizedBox(height: 1,),
                           Container(
                            
                            decoration: BoxDecoration(
                              color: accentColor,
                              borderRadius: BorderRadiusDirectional.only(bottomEnd: Radius.circular(5),bottomStart: Radius.circular(5))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 19),
                              child: Text(groupe.toString()),
                            )),
                            
                           ],
            ),
          )
        ],
      ),
      Text(contenu),
    ],
  ));
}
