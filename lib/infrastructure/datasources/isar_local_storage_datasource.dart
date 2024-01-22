import 'package:isar/isar.dart';
import 'package:plantify/domain/datasources/local_storage_datasource.dart';
import 'package:plantify/domain/entities/plant.dart';
import 'package:path_provider/path_provider.dart';

class IsarDataSource extends LocalStorageDatasource {
  late Future<Isar> db;

  IsarDataSource() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([PlantSchema],
          inspector: true, directory: dir.path);
    }

    return Future.value(Isar.getInstance());
  }

  @override
  Future<bool> deletePlant(Id id) async {
    final isar = await db;
    final plant = await isar.plants.filter().idEqualTo(id).findFirst();
    if (plant != null) {
      isar.writeTxnSync(() => isar.plants.deleteSync(id));
      return true;
    }
    return false;
  }

  @override
  Future<bool> savePlant(Plant plant) async {
    final isar = await db;
    isar.writeTxnSync(() => isar.plants.putSync(plant));
    return true;
  }

  @override
  Future<bool> updatePlant(Id id, Plant plant) async {
    final isar = await db;
    final originalPlant = await isar.plants.get(id);
    if (originalPlant == null) return false;
    originalPlant.plantName = plant.plantName;
    originalPlant.waterHour = plant.waterHour;
    originalPlant.description = plant.description;
    isar.writeTxnSync(() => isar.plants.putSync(originalPlant));
    return true;
  }

  @override
  Future<List<Plant>> getPlants({int limit = 10, offset = 0}) async {
    final isar = await db;
    return isar.plants.where().offset(offset).limit(limit).findAll();
  }

  @override
  Future<Plant> getPlant(Id id) async {
    final isar = await db;
    final Plant? plant = await isar.plants.get(id);
    if (plant != null) return plant;
    //Dado que el usuario no puede ingresar el id manualmente nunca deberia haber errores
    throw 'La planta no existe';
  }
}
