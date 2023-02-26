import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomText extends StatelessWidget {
  CustomText({super.key, required this.color, required this.txt});
  String txt;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 8, bottom: 14),
      child: Text(
        txt,
        style:
            TextStyle(color: color, fontWeight: FontWeight.w900, fontSize: 14),
      ),
    );
  }
}
