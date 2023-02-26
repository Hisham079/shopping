part of 'order_bloc.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class OrderInitial extends OrderState {}

class AddOrderSuccess extends OrderState {}

class AddOrderFailed extends OrderState {
  AddOrderFailed({required this.error_message});
  String error_message;
}
