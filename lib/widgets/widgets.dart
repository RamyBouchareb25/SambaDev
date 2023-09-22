import 'package:flutter/material.dart';
import 'package:sambadev/global.dart';

Widget Forms(TextEditingController controller, String label) {
  return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
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

// Widget appBar(Size size) {
//   return Container(
//     width: size.width,
//     color: Colors.white,
//     Row(children: [
//       Image(image: AssetImage('Asset/Logo-1.png')),
//     ],)
//   );
// }

class Button extends StatelessWidget {
<<<<<<< Updated upstream
  Button(
      {required this.title,
=======
  const Button(
      {super.key,
      required this.title,
>>>>>>> Stashed changes
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
      onPressed: () {
        onPressed;
      },
      child: Text(title),
    );
  }
}
