import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitial()) {
    on<OrderEvent>((event, emit) async {
      if (event is AddProductEvent) {
        try {
          final auth = FirebaseAuth.instance;
          final orderData = FirebaseFirestore.instance.collection('OrderPlace');
          final userId = auth.currentUser!.uid;
          const uuid = Uuid();
          final prdctId = uuid.v4();
          await orderData.doc(prdctId).set({
            'poductId': prdctId,
            'image': event.image,
            'price': event.price,
            'name': event.name,
            'description': event.description
          });
          emit(AddOrderSuccess());
        } on FirebaseAuthException catch (e) {
          emit(
            AddOrderFailed(error_message: e.code),
          );
        }
      }
    });
  }
}
