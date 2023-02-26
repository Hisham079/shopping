import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shopping_app/module/home/screens/myorders/local_widget/order_data.dart';

class MyOrder extends StatelessWidget {
  MyOrder({super.key});
  final taskRef = FirebaseFirestore.instance.collection('OrderPlace');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: taskRef.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final bookingData = snapshot.data!.docs;

            return Scaffold(
              body: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ListTile(
                      leading: Icon(Icons.notes),
                      trailing: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://www.pngfind.com/pngs/m/676-6764065_default-profile-picture-transparent-hd-png-download.png'),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, top: 14),
                      child: Text(
                        'My Orders',
                        style: TextStyle(
                            fontSize: 29,
                            color: Color.fromARGB(220, 2, 29, 52),
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, top: 14, bottom: 5),
                      child: Text(
                        'Check you status',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height - 200,
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return const Divider(
                              thickness: 2,
                            );
                          },
                          itemCount: bookingData.length,
                          itemBuilder: (context, index) {
                            return OrderTile(
                              orderId: '${bookingData[index]['poductId']}',
                              image: bookingData[index]['image'],
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
