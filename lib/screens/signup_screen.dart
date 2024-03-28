import 'package:flutter/material.dart';

import 'package:motivations/controllers/signup_controllers.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignupScreen> {
  var userForm = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup"),
      ),
      body: Form(
        key: userForm,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Image.asset("assets/images/logo.png"),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: email,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    }
                  },
                  decoration: InputDecoration(label: Text("Email")),
                ),
                SizedBox(height: 23),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: password,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    }
                  },
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(label: Text("Password")),
                ),
                SizedBox(height: 23),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white70,
                              backgroundColor: Colors.amber[800]),
                          onPressed: () {
                            if (userForm.currentState!.validate()) {
                              SignupController.createAccount(
                                  context: context,
                                  email: email.text,
                                  password: password.text);
                            }
                          },
                          child: Text("Create an account")),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
