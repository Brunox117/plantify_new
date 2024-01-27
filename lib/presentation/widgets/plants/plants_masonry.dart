import 'package:flutter/material.dart';
import 'package:plantify/domain/entities/plant.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:plantify/presentation/widgets/widgets.dart';

class PlantsMasonry extends StatefulWidget {
  final List<Plant> plants;
  final VoidCallback? loadNextPage;
  const PlantsMasonry({super.key, required this.plants, this.loadNextPage});

  @override
  State<PlantsMasonry> createState() => _PlantsMasonryState();
}

class _PlantsMasonryState extends State<PlantsMasonry> {
  final scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (widget.loadNextPage == null) return;
      if ((scrollController.position.pixels + 100) >=
          scrollController.position.maxScrollExtent) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      controller: scrollController,
      crossAxisCount: 2,
      itemCount: widget.plants.length,
      itemBuilder: (context, index) {
        return PlantMenu(plant: widget.plants[index]);
      },
    );
  }
}
