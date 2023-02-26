part of 'nav_bar_cubit.dart';

// @immutable
// abstract class NavBarState {}

// class NavBarInitial extends NavBarState {}
class BottomNavState extends Equatable {
  BottomNavState({required this.index, required this.navbarItem});
  final NavbarItem navbarItem;
  final int index;
  
  @override
  
  List<Object?> get props => [this.index,this.navbarItem];
 
 
}
