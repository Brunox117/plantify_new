import 'package:isar/isar.dart';

part 'plant.g.dart';

@collection
class Plant {
  Id id = Isar.autoIncrement;
  String plantName;
  String waterHour;
  String? description;
  //String photoPath;
  //Bool watered; 
  Plant({
    required this.plantName,
    required this.waterHour,
    this.description = '',
    //this.pohotoPath = BUSCAR FOTO STOCK,
    //this.watered = false,
  });
}
