import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final Size? textSize;

  const BigText({Key? key, required this.text, this.textSize, this.textAlign, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Text(
        'Email',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
      ),
    );
  }
}
