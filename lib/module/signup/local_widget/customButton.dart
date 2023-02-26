import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.ontap, required this.text});
  String text;
  void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 45,
        width: MediaQuery.of(context).size.width - 80,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(3, 3),
              blurRadius: 6,
              color: Colors.grey.shade400,
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(220, 3, 50, 92),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 17, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
