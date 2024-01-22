import 'package:isar/isar.dart';

part 'plant.g.dart';

@collection
class Plant {
  Id id = Isar.autoIncrement;
  String plantName;
  String waterHour;
  String? description;
  Plant({
    required this.plantName,
    required this.waterHour,
    this.description = '',
  });
}
