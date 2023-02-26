part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class SignUpEvent extends AuthenticationEvent {
  String email;
  String password;
  String name;
  SignUpEvent({required this.email, required this.password,required this.name});
}
