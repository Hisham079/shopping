part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {}

class AuthenticationFailed extends AuthenticationState {
  String error_message;
  AuthenticationFailed({required this.error_message});
}
