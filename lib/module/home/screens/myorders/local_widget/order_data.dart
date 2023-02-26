import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class OrderTile extends StatelessWidget {
  OrderTile({super.key, required this.image, required this.orderId});
  String orderId;
  String image;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text(
        'Order Id:',
        style: TextStyle(
            fontSize: 17,
            color: Color.fromARGB(220, 2, 29, 52),
            fontWeight: FontWeight.w600),
      ),
      subtitle: Text(orderId),
      trailing: SizedBox(
        height: 100,
        width: MediaQuery.of(context).size.width - 264,
        child: Image.network(
          image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
