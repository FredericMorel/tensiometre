import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final double fontSize;
  final TextAlign? textAlign;
  final Color? color;

  const BigText({Key? key, required this.fontSize, this.textAlign, this.color})
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
