import 'package:docs_google/colors.dart';
import 'package:docs_google/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KWhiteColor,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
            color: KBlackColor,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
            color: KRedColor,
          ),
        ],
      ),
    );
  }
}
