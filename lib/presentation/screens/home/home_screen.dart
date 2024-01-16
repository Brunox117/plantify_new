import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plantify/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  final StatefulNavigationShell currentChild;
  const HomeScreen({super.key, required this.currentChild});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentChild,
      bottomNavigationBar: CustomBottomNavBar(currentChild: currentChild),
    );

  }
}