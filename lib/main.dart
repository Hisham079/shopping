import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/firebase_options.dart';
import 'package:shopping_app/module/home/cubit/nav_bar_cubit.dart';
import 'package:shopping_app/module/home/screens/homeScreen/homeScreen.dart';
import 'package:shopping_app/module/signup/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit(),
      child: ScreenUtilInit(
        builder: (context, child) {
          return MaterialApp(
          home: Signup(),
        );
        },
        
      ),
    );
  }
}
