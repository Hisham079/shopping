import 'package:auth/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is UserLoginEvent) {
        final auth = FirebaseAuth.instance;

        try {
          await auth.signInWithEmailAndPassword(
              email: event.email, password: event.password);
          emit(LoginSuccess());
        } on FirebaseException catch (e) {
          emit(LoginFailed(error_message: e.code));
        }
      }
    });
  }
}
