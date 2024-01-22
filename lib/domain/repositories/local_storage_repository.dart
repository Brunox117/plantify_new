import 'package:isar/isar.dart';

import '../entities/plant.dart';

abstract class LocalStorageRepository {
  
  Future<bool> savePlant(Plant plant);

  Future<Plant> getPlant(Id id);

  Future<List<Plant>> getPlants({int limit = 10, offset = 0});

  Future<bool> deletePlant(Id id);

  Future<bool> updatePlant(Id id, Plant plant);

}