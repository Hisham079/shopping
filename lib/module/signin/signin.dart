import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/module/home/homePage.dart';
import 'package:shopping_app/module/signin/bloc/login_bloc.dart';
import 'package:shopping_app/module/signup/local_widget/customButton.dart';

import '../signup/local_widget/textField.dart';

class Signin extends StatelessWidget {
  Signin({super.key});
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => loginBloc,
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            } else if (state is LoginFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error_message),
                ),
              );
            }
          },
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              'SignIn',
              style: TextStyle(
                  color: Color.fromARGB(220, 3, 50, 92),
                  fontSize: 29,
                  fontWeight: FontWeight.w900),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              hideData: false,
              controller: _email,
              hintTxt: 'Email',
            ),
            CustomTextField(
              hideData: true,
              controller: _password,
              hintTxt: 'Password',
            ),
           CustomButton(ontap: () {
              loginBloc.add(
                  UserLoginEvent(email: _email.text, password: _password.text),
                );
           }, text: 'Login')
          ]),
        ),
      ),
    );
  }
}
