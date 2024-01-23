import 'package:flutter/material.dart';
import 'package:plantify/presentation/widgets/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbar(
        title: 'Inicio',
      ),
      body: Center(child: PlantMenu()),
    );
  }
}
