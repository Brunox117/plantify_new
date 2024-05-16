import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plantify/domain/entities/plant.dart';
import 'package:plantify/presentation/providers/providers.dart';

class PlantView extends ConsumerWidget {
  final String id;
  const PlantView({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final plantsNotifier = ref.watch(plantsProvider.notifier);
    
    return FutureBuilder<Plant>(
      future: plantsNotifier.getPlant(int.parse(id)),
      builder: (BuildContext context, AsyncSnapshot<Plant> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator(),
            );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Error al cargar la planta'),
          );
        } else if (snapshot.hasData) {
          final plant = snapshot.data!;
          return SyncPlantView(plant: plant);
        } else {
          return const Center(
            child: Text('La planta no existe!!!'),
          );
        }
      },
    );
  }
}


class SyncPlantView extends StatelessWidget {
  final Plant plant;
  const SyncPlantView({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(plant.plantName),
      ),
      body: Center(
        child: Text('Hora de riego: ${plant.waterHour}'),
      ),
    );
  }
}
