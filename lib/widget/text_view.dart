import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  const TextView({super.key, required this.text, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
    );
  }
}
