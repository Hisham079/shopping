import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/module/home/local_widget/customText.dart';
import 'package:shopping_app/module/home/local_widget/products.dart';
import 'package:shopping_app/module/home/screens/homeScreen/bloc/collection_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final data = FirebaseFirestore.instance.collection('NikeShoes');
    final auth = FirebaseAuth.instance;
    final colctnBloc = CollectionBloc();

    return BlocProvider(
      create: (context) => colctnBloc,
      child: BlocListener<CollectionBloc, CollectionState>(
        listener: (context, state) {
          if (state is CollectionSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('success'),
              ),
            );
          } else if (state is CollectionFailed) {
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
                final task_data = snapshot.data!.docs;
                return SafeArea(
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.transparent,
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
                        Container(
                          margin: const EdgeInsets.only(
                              top: 10, left: 30, bottom: 10),
                          height: 50.h,
                          width: size.width - 60.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 10, color: Colors.grey)
                            ],
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Container(
                            height: MediaQuery.of(context).size.height - 300.h,
                            margin: const EdgeInsets.all(3),
                            child: const TextField(
                              decoration: InputDecoration(
                                  suffixIcon: CircleAvatar(
                                    backgroundColor: Colors.cyan,
                                    maxRadius: 10,
                                    minRadius: 5,
                                    // minRadius: 10,
                                    child: Icon(
                                      Icons.search,
                                      color: Colors.white,
                                    ),
                                  ),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(30, 8, 0, 0),
                                  // enabled: false,
                                  border: InputBorder.none,
                                  hintText: 'Find shoes',
                                  hintStyle: TextStyle(color: Colors.grey)),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20, top: 8),
                          child: Text(
                            'Categories',
                            style: TextStyle(
                                fontSize: 29,
                                color: Color.fromARGB(220, 3, 50, 92),
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        Row(
                          children: [
                            CustomText(
                                color: const Color.fromARGB(220, 3, 50, 92),
                                txt: 'Nike'),
                            CustomText(color: Colors.grey, txt: 'Adidas'),
                            CustomText(color: Colors.grey, txt: 'Puma'),
                            CustomText(color: Colors.grey, txt: 'Balenciaga'),
                            CustomText(color: Colors.grey, txt: 'Converse')
                          ],
                        ),
                        Expanded(
                          child: Container(
                            height: 5 / 80,
                            width: 350,
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 180,
                                      childAspectRatio: 1.1 / 1.2,
                                      crossAxisSpacing: 0,
                                      mainAxisSpacing: 0),
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return Products(
                                  ontap: () {
                                    colctnBloc.add(
                                      AddCollection(
                                          description: task_data[index]
                                              ['description'],
                                          image: task_data[index]['image'],
                                          name: task_data[index]['name'],
                                          price: task_data[index]['price']),
                                    );
                                  },
                                  description: task_data[index]['description']
                                      .toString(),
                                  price: task_data[index]['price'],
                                  image: task_data[index]['image'],
                                  name: task_data[index]['name'],
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
            }),
      ),
    );
  }
}
