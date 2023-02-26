import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/module/home/homePage.dart';
import 'package:shopping_app/module/signup/local_widget/customButton.dart';

Future<void> bookingConfirm({BuildContext? context}) {
  final prdctRef = FirebaseFirestore.instance.collection('OrderPlace');
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context!,
    builder: (context) {
      return StreamBuilder(
          stream: prdctRef.snapshots(),
          builder: (context, snapshot) {
            final data = snapshot.data!.docs;
            if (snapshot.hasData) {
              return Expanded(
                child: Padding(
                  padding: MediaQuery.of(context).viewInsets,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: const Color.fromARGB(255, 246, 238, 240),
                    ),
                    height: MediaQuery.of(context).size.height / 4,
                   
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 18,
                            ),
                            const Text(
                              'Order Placed Successfully',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 23,
                                  color: Color.fromARGB(255, 19, 71, 21)),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text('Total Amount${data[index]['price']}'),
                            const SizedBox(
                              height: 10,
                            ),
                            Text('Order Id:${data[index]['poductId']}'),
                            const SizedBox(
                              height: 30,
                            ),
                            CustomButton(
                                ontap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomePage(),
                                    ),
                                  );
                                },
                                text: 'Back to Home')
                          ],
                        );
                      },
                      //  children: [
                    ),
                  ),
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          });
    },
  );
}
