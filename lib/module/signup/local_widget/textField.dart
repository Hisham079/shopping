
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.hintTxt,
      required this.controller,
      this.validator,
      required this.hideData});
  String hintTxt;
  TextEditingController controller;

  String? Function(String?)? validator;
  bool hideData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(3, 3),
              blurRadius: 6,
              color: Colors.grey.shade400,
            ),
          ],
        ),
        child: TextFormField(
          obscureText: hideData,
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 10),
              hintText: hintTxt),
        ),
      ),
    );
  }
}
