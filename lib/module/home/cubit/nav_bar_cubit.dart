import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shopping_app/module/home/cubit/nav_item/nav_bar_item.dart';

part 'nav_bar_state.dart';

class NavBarCubit extends Cubit<BottomNavState> {
  NavBarCubit() : super(BottomNavState(navbarItem: NavbarItem.home, index: 0));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.chat:
        emit(BottomNavState(index: 1, navbarItem: NavbarItem.chat));
        break;
      case NavbarItem.favorite:
        emit(BottomNavState(index: 4, navbarItem: NavbarItem.favorite));
        break;
      case NavbarItem.order:
        emit(BottomNavState(index: 3, navbarItem: NavbarItem.order));
        break;
      case NavbarItem.profile:
        emit(BottomNavState(index: 2, navbarItem: NavbarItem.profile));
        break;
      case NavbarItem.home:
        emit(BottomNavState(index: 0, navbarItem: NavbarItem.home));
        break;
    }
  }
}
