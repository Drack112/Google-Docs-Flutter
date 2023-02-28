import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton.icon(
        onPressed: () {},
        label: const Text("Sign In with Google"),
        icon: Image.asset(
          "assets/images/g-logo-2.png",
          height: 20,
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          minimumSize: const Size(150, 50),
        ),
      ),
    );
  }
}
