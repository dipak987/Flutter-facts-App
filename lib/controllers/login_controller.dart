import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:motivations/screens/dashboard_screen.dart';

class LoginController {
  static Future<void> login(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return DashboardScreen();
      }), (route) {
        return false;
      });
      print("Account created successfully");
    } catch (e) {
      SnackBar messageSnackBar = SnackBar(content: Text(e.toString()));

      ScaffoldMessenger.of(context).showSnackBar(messageSnackBar);
      print(e);
    }
  }
}
