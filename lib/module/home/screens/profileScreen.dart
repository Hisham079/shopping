import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/module/signin/signin.dart';
import 'package:shopping_app/module/signup/local_widget/customButton.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomButton(
            ontap: () {
              logOut();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Signin(),
                ),
              );
            },
            text: 'Log out'),
      ),
    );
  }
}

void logOut() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  await sharedPrefs.clear();
  FirebaseAuth.instance.signOut();
}
