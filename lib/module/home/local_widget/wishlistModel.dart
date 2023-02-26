import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class WhishlistModel extends StatelessWidget {
  WhishlistModel(
      {super.key,
      required this.description,
      required this.image,
      required this.name,
      required this.price,
      required this.ontap,
      required this.onPressed});
  String price;
  String image;
  String name;
  String description;
  void Function() ontap;
  void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.all(12),
        height: size.height / 7,
        width: size.width - 25,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: const [
              BoxShadow(color: Colors.blueGrey, blurRadius: 5)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                                color: Color.fromARGB(
                                  220,
                                  2,
                                  29,
                                  52,
                                ),
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            description,
                            style: const TextStyle(
                                color: Color.fromARGB(
                                  220,
                                  2,
                                  29,
                                  52,
                                ),
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '\$',
                            style: TextStyle(
                                color: Colors.cyan,
                                fontWeight: FontWeight.w900),
                          ),
                          Text(
                            price,
                            style: const TextStyle(
                                color: Color.fromARGB(
                                  220,
                                  2,
                                  29,
                                  52,
                                ),
                                fontWeight: FontWeight.w900),
                          ),
                          const SizedBox(
                            width: 70,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Size:43',
                            style: TextStyle(
                                color: Color.fromARGB(
                                  220,
                                  2,
                                  29,
                                  52,
                                ),
                                fontWeight: FontWeight.w900),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Quantity:2',
                            style: TextStyle(
                                color: Color.fromARGB(
                                  220,
                                  2,
                                  29,
                                  52,
                                ),
                                fontWeight: FontWeight.w900),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(onTap: onPressed, child: const Icon(Icons.delete))
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width - 264,
                    child: Image.network(
                      image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
