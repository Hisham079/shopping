import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/module/home/cubit/nav_bar_cubit.dart';
import 'package:shopping_app/module/home/cubit/nav_item/nav_bar_item.dart';
import 'package:shopping_app/module/home/screens/bookingDetails/wishList/wishList.dart';
import 'package:shopping_app/module/home/screens/chatScreen.dart';
import 'package:shopping_app/module/home/screens/homeScreen/homeScreen.dart';
import 'package:shopping_app/module/home/screens/myorders/myOrders.dart';
import 'package:shopping_app/module/home/screens/profileScreen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavBarCubit, BottomNavState>(
        builder: (context, state) {
          if (state.navbarItem == NavbarItem.home) {
            return const HomeScreen();
          } else if (state.navbarItem == NavbarItem.chat) {
            return const ChatScreen();
          } else if (state.navbarItem == NavbarItem.favorite) {
            return const ProfileScreen();
          } else if (state.navbarItem == NavbarItem.order) {
            return MyOrder();
          } else if (state.navbarItem == NavbarItem.profile) {
            return WishList();
          } else {
            return Container();
          }
        },
      ),
      bottomNavigationBar: BlocBuilder<NavBarCubit, BottomNavState>(
        builder: (context, state) {
          return Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: BottomNavigationBar(
                currentIndex: state.index,
                type: BottomNavigationBarType.fixed,
                showUnselectedLabels: false,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_filled), label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.chat_bubble_outline), label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite), label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.card_travel_outlined), label: ''),
                  BottomNavigationBarItem(icon: Icon(Icons.person), label: '')
                ],
                onTap: (value) {
                  if (value == 0) {
                    BlocProvider.of<NavBarCubit>(context)
                        .getNavBarItem(NavbarItem.home);
                  } else if (value == 1) {
                    BlocProvider.of<NavBarCubit>(context)
                        .getNavBarItem(NavbarItem.chat);
                  } else if (value == 2) {
                    BlocProvider.of<NavBarCubit>(context)
                        .getNavBarItem(NavbarItem.profile);
                  } else if (value == 3) {
                    BlocProvider.of<NavBarCubit>(context)
                        .getNavBarItem(NavbarItem.order);
                  } else if (value == 4) {
                    BlocProvider.of<NavBarCubit>(context)
                        .getNavBarItem(NavbarItem.favorite);
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
