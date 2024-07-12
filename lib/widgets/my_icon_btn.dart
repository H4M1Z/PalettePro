import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  const MyIconButton(
      {super.key,
      required this.onTap,
      required this.icon,
      required this.btnText});

  final VoidCallback onTap;
  final IconData icon;
  final String btnText;

  static const textStyle = TextStyle(color: Colors.black, fontSize: 10);
  @override
  Widget build(BuildContext context) {
    final Size(:height) = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: IconButton(
              onPressed: onTap,
              icon: Icon(
                icon,
                size: height * 0.025,
              )),
        ),
        Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(
              btnText,
              style: textStyle,
            ),
          ),
        ),
      ],
    );
  }
}
