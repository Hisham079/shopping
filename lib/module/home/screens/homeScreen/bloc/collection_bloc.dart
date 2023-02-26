import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

part 'collection_event.dart';
part 'collection_state.dart';

class CollectionBloc extends Bloc<CollectionEvent, CollectionState> {
  CollectionBloc() : super(CollectionInitial()) {
    on<CollectionEvent>((event, emit) async {
      if (event is AddCollection) {
        try {
          final auth = FirebaseAuth.instance;
          final wishList = FirebaseFirestore.instance.collection('wishList');
          final userId = auth.currentUser!.uid;
          const uuid = Uuid();
          final prdctId = uuid.v4();
          await wishList.doc().set({
            'poductId': prdctId,
            'image': event.image,
            'price': event.price,
            'name': event.name,
            'description': event.description
          });
          emit(CollectionSuccess());
        } on FirebaseAuthException catch (e) {
          emit(
            CollectionFailed(error_message: e.code),
          );
        }
      }
    });
  }
}
