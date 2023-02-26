import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/module/signin/signin.dart';
import 'package:shopping_app/module/signup/bloc/authentication_bloc.dart';
import 'package:shopping_app/module/signup/local_widget/customButton.dart';
import 'package:shopping_app/module/signup/local_widget/textField.dart';

class Signup extends StatelessWidget {
  Signup({super.key});
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _name = TextEditingController();
  final regBloc = AuthenticationBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: BlocProvider(
        create: (context) => regBloc,
        child: BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state is AuthenticationSuccess) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Signin(),
                ),
              );
              
            } else if (state is AuthenticationFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error_message),
                ),
              );
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'SignUp',
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
                controller: _name,
                hintTxt: 'Name',
              ),
              CustomTextField(
                hideData: false,
                controller: _email,
                hintTxt: 'Email',
              ),
              CustomTextField(
                controller: _password,
                hintTxt: 'Password',
                hideData: true,
              ),
              CustomButton(text: 'Signup',ontap: () {
                 regBloc.add(
                  SignUpEvent(
                      email: _email.text,
                      password: _password.text,
                      name: _name.text),
                );
              },),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Signin(),
                          ),
                        );
                      },
                      child: const Text('Signin')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
