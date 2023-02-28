import 'package:docs_google/colors.dart';
import 'package:docs_google/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  void signInWithGoogle(WidgetRef ref) {
    ref.read(authRepositoryProvider).SignInWithGoogle();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ElevatedButton.icon(
        onPressed: () => signInWithGoogle(ref),
        label: const Text(
          "Sign In with Google",
          style: TextStyle(
            color: KBlackColor,
          ),
        ),
        icon: Image.asset(
          "assets/images/g-logo-2.png",
          height: 20,
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: KWhiteColor,
          minimumSize: const Size(150, 50),
        ),
      ),
    );
  }
}
