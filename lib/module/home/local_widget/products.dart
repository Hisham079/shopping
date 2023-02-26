import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Products extends StatelessWidget {
  Products(
      {super.key,
      required this.description,
      required this.image,
      required this.name,
      required this.price,
      required this.ontap});
  String price;
  String image;
  String name;
  String description;
  void Function() ontap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.all(5),
      height: size.height - 592.h,
      width: size.width - 205.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [const BoxShadow(color: Colors.blueGrey, blurRadius: 5)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 13, top: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '\$',
                  style: TextStyle(
                      color: Colors.cyan, fontWeight: FontWeight.w900),
                ),
                Text(
                  price,
                  style: const TextStyle(
                      color: Color.fromARGB(220, 3, 50, 92),
                      fontWeight: FontWeight.w900),
                ),
                const SizedBox(
                  width: 30,
                ),
                GestureDetector(
                    onTap: ontap,
                    child: const Text(
                      'Add to Cart',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: SizedBox(
              height: 100.h,
              width: 130.w,
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              name,
              style: const TextStyle(
                  color: Color.fromARGB(220, 3, 50, 92),
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              description,
              style: const TextStyle(
                  color: Color.fromARGB(220, 3, 50, 92),
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
