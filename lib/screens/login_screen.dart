import 'package:docs_google/colors.dart';
import 'package:docs_google/repository/auth_repository.dart';
import 'package:docs_google/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  void signInWithGoogle(WidgetRef ref, BuildContext context) async {
    final sMessenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    final errorModel =
        await ref.read(authRepositoryProvider).signInWithGoogle();

    if (errorModel.error == null) {
      await ref.read(userProvider.notifier).update(
            (state) => errorModel.data,
          );
      navigator.push(
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ElevatedButton.icon(
        onPressed: () => signInWithGoogle(ref, context),
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
