part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class AddProductEvent extends OrderEvent {
  AddProductEvent(
      {required this.description,
      required this.image,
      required this.name,
      required this.price});
  String price;
  String image;
  String name;
  String description;
}
