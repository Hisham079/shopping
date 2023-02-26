import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shopping_app/module/home/screens/bookingDetails/bookingConfirm.dart';
import 'package:shopping_app/module/home/screens/bookingDetails/productDetails/local_widget/productPrice.dart';
import 'package:shopping_app/module/signup/local_widget/customButton.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({super.key});
  final productData = FirebaseFirestore.instance.collection('OrderPlace');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: productData.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!.docs;
            return Scaffold(
              body: SafeArea(
                child: ListView.builder(
                  itemCount: 1,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(Icons.arrow_back_ios)),
                          trailing: CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://www.pngfind.com/pngs/m/676-6764065_default-profile-picture-transparent-hd-png-download.png'),
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                                margin: const EdgeInsets.all(14),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data[index]['name'],
                                      style: const TextStyle(
                                          color: Color.fromARGB(220, 3, 50, 92),
                                          fontWeight: FontWeight.w900,
                                          fontSize: 14),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    SizedBox(
                                      width: 180,
                                      child: Text(
                                        data[0]['description'],
                                        style: const TextStyle(
                                            fontSize: 22,
                                            color:
                                                Color.fromARGB(220, 3, 50, 92),
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Men\'s Shoe',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 14),
                                    ),
                                  ],
                                )),
                            Padding(
                              padding: const EdgeInsets.only(left: 30, top: 50),
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height - 406,
                                width: MediaQuery.of(context).size.width - 50,
                                child: Image.network(data[0]['image']),
                              ),
                            )
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(color: Colors.grey, blurRadius: 10)
                              ]),
                          child: Container(
                            margin: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data[index]['description'],
                                  style: const TextStyle(
                                      color: Color.fromARGB(220, 3, 50, 92),
                                      fontWeight: FontWeight.w900,
                                      fontSize: 17),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                    // height: MediaQuery.of(context).size.height - 481,
                                    width: MediaQuery.of(context).size.width,
                                    child: const Text(
                                      'One of the games fierecast copentitors, triple-double dynamo Russell Westbook has the motor, muscle and mentality to match his fearlessness-with the stats to back it up.',
                                      style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.w500),
                                    )),
                                ProductPrice(
                                    text:
                                        'Amount to Pay:${data[index]['price']}'),
                                Row(
                                  children: [
                                    ProductPrice(
                                        text: 'Payment Status:Confirmed'),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    ElevatedButton(
                                        style: const ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Color.fromARGB(
                                                        220, 3, 50, 92))),
                                        onPressed: () {},
                                        child: const Text('pay'))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomButton(
                                        ontap: () =>
                                            bookingConfirm(context: context),
                                        text: 'Place Order'),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
