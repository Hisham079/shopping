import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/module/home/screens/homeScreen/homeScreen.dart';
import 'package:shopping_app/module/signin/signin.dart';
import 'package:shopping_app/module/splashscreen/bloc/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final splashBloc = SplashBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => splashBloc..add(SplashToLoginEvent()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is NavigateToHome) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Signin(),
              ),
            );
          }
        },
        child: Scaffold(
          body: Column(
            children: [
              Container(
               height: 500,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 252, 251, 251),
                  image: DecorationImage(
                      image: AssetImage(
                        'Assets/images/splash3.png',
                      ),
                      fit: BoxFit.fitWidth),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                  ),
                ),
               
              ),
             
              const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text('Welcome to Shopify',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
