import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plantify/domain/repositories/local_storage_repository.dart';
import 'package:plantify/presentation/providers/providers.dart';

import '../../../domain/entities/plant.dart';

final plantsProvider =
    StateNotifierProvider<StoragePlantsNotifier, Map<int, Plant>>((ref) {
  final localStorageRepository = ref.watch(localStorageRespositoryProvider);
  return StoragePlantsNotifier(localStorageRepository: localStorageRepository);
});

class StoragePlantsNotifier extends StateNotifier<Map<int, Plant>> {
  int page = 0;
  final LocalStorageRepository localStorageRepository;

  StoragePlantsNotifier({required this.localStorageRepository}) : super({});

  Future<List<Plant>> loadNextPage() async {
    final plants =
        await localStorageRepository.getPlants(offset: page * 10, limit: 20);
    page++;
    final tempPlantsMap = <int, Plant>{};
    for (final plant in plants) {
      tempPlantsMap[plant.id] = plant;
    }
    state = {...state, ...tempPlantsMap};
    return plants;
  }

  Future<void> addPlant (Plant plant) async {
    await localStorageRepository.savePlant(plant);
    state = { ...state, plant.id: plant};
  }

  Future<Plant> getPlant (int id) async {
    Plant plant = await localStorageRepository.getPlant(id);
    return plant;
  }

  
}
