import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProductPrice extends StatelessWidget {
  ProductPrice({super.key,required this.text});
  String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
            color: Color.fromARGB(220, 3, 50, 92),
            fontWeight: FontWeight.w900,
            fontSize: 14),
      ),
    );
  }
}
