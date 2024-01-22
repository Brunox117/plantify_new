import 'package:isar/isar.dart';
import 'package:plantify/domain/datasources/local_storage_datasource.dart';
import 'package:plantify/domain/entities/plant.dart';
import 'package:plantify/domain/repositories/local_storage_repository.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  final LocalStorageDatasource datasource;

  LocalStorageRepositoryImpl({required this.datasource});
  @override
  Future<bool> deletePlant(Id id) {
    return datasource.deletePlant(id);
  }

  @override
  Future<bool> savePlant(Plant plant) {
    return datasource.savePlant(plant);
  }

  @override
  Future<bool> updatePlant(Id id, Plant plant) {
    return datasource.updatePlant(id, plant);
  }

  @override
  Future<List<Plant>> getPlants({int limit = 10, offset = 0}) {
    return datasource.getPlants(limit: limit, offset: offset);
  }

  @override
  Future<Plant> getPlant(Id id) {
    return datasource.getPlant(id);
  }
}
