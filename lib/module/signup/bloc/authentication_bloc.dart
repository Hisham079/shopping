import 'package:auth/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) async {
      if (event is SignUpEvent) {
        final auth = FirebaseAuth.instance;
        final userRef = FirebaseFirestore.instance.collection('Users');

        try {
          await auth.createUserWithEmailAndPassword(
              email: event.email, password: event.password);
          await userRef.doc(auth.currentUser!.uid).set({
            'userId': auth.currentUser!.uid,
            'email': event.email,
            'password': event.password,
            'name': event.name
          });
          emit(AuthenticationSuccess());
        } on FirebaseException catch (e) {
          emit(AuthenticationFailed(error_message: e.code));
        }
      }
    });
  }
}
