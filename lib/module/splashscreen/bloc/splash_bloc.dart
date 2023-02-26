import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping_app/module/sharedprefRepo/sharedPref.dart';
import 'package:shopping_app/module/signup/signup.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashEvent>((event, emit) async {
      if (event is SplashToLoginEvent) {
        await Future.delayed(Duration(seconds: 5));
        final data = await SharedPref().getUserData();
        if (data['isLogin'] == true) {
          emit(NavigateToHome());
        } else {
          emit(NavigateToLogin());
        }
      }
    });
  }
}
