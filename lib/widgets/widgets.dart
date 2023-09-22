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
