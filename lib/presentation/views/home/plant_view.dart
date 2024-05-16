import 'package:flutter/material.dart';

class PlantView extends StatelessWidget {
  final String id;
  const PlantView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Text('Plant View $id'),
    );
  }
}
