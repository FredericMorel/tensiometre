import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;

  SmallText({Key? key, required this.text, this.color, this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          this.text,
          style: TextStyle(color: color == null ? Colors.black : color),
          textAlign: textAlign == null ? TextAlign.center : textAlign,
        ),
      ),
    );
  }
}
