import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/module/home/local_widget/wishlistModel.dart';
import 'package:shopping_app/module/home/screens/bookingDetails/productDetails/productDetail.dart';
import 'package:shopping_app/module/home/screens/bookingDetails/wishList/bloc/order_bloc.dart';

class WishList extends StatelessWidget {
  WishList({super.key});
  final data = FirebaseFirestore.instance.collection('wishList');
  final orderBloc = OrderBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => orderBloc,
      child: BlocListener<OrderBloc, OrderState>(
        listener: (context, state) {
          if (state is AddOrderSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('success'),
              ),
            );
          } else if (state is AddOrderFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error_message),
              ),
            );
          }
        },
        child: StreamBuilder(
            stream: data.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                final prdctData = snapshot.data!.docs;

                return SafeArea(
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
                          'Whish List',
                          style: TextStyle(
                              fontSize: 29,
                              color: Color.fromARGB(220, 2, 29, 52),
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20, top: 14),
                        child: Text(
                          'Check and pay',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height - 200,
                          child: ListView.builder(
                            itemCount: prdctData.length,
                            itemBuilder: (context, index) {
                              return WhishlistModel(
                                ontap: () {
                                  orderBloc.add(
                                    AddProductEvent(
                                      description: prdctData[index]
                                          ['description'],
                                      image: prdctData[index]['image'],
                                      name: prdctData[index]['name'],
                                      price: prdctData[index]['price'],
                                    ),
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductDetails(),
                                    ),
                                  );
                                },
                                description: prdctData[index]['description'],
                                image: prdctData[index]['image'],
                                name: prdctData[index]['name'],
                                price: prdctData[index]['price'],
                                onPressed: () {},
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
