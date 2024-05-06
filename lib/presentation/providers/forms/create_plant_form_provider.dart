import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:plantify/domain/entities/plant.dart';

import '../../../infrastructure/inputs/plant_inputs.dart';

final createPlantProvider =
    StateNotifierProvider<CreatePlantNotifier, CreatePlantState>(
  (ref) => CreatePlantNotifier(),
);

class CreatePlantNotifier extends StateNotifier<CreatePlantState> {
  CreatePlantNotifier() : super(const CreatePlantState());

  void onPlantNameChanged(String value) {
    state = state.copyWith(
      plantName: PlantName.dirty(value),
    );
  }

  void resetForm() {
    state = state.copyWith(
      plantName: const PlantName.pure(),
      waterHour: const WaterHour.pure(),
      description: '',
    );
  }
  void onWaterHourChanged(String value) {
    state = state.copyWith(
      waterHour: WaterHour.dirty(value),
    );
  }

  void onDescriptionChanged(String value) {
    state = state.copyWith(
      description: value,
    );
  }

  void touchAllFields() {
    state = state.copyWith(
      isFormValid: Formz.validate([
        PlantName.dirty(state.plantName.value),
        WaterHour.dirty(state.waterHour.value),
      ]),
    );
  }

  Future<Plant> onSubmit() async {
    touchAllFields();
    if (!state.isFormValid) throw 'Hubo un error';
    final Plant plant = Plant(
      plantName: state.plantName.value,
      waterHour: state.waterHour.value,
      description: state.description,
    );
    //print('Planta creada :D!!!');
    // print(plant.plantName);
    // print(plant.waterHour);
    // print(plant.description);
    return plant;
  }
}

class CreatePlantState {
  final PlantName plantName;
  final WaterHour waterHour;
  final String description;
  final bool isFormValid;

  const CreatePlantState({
    this.plantName = const PlantName.pure(),
    this.waterHour = const WaterHour.pure(),
    this.description = '',
    this.isFormValid = false,
  });

  CreatePlantState copyWith({
    PlantName? plantName,
    WaterHour? waterHour,
    String? description,
    bool? isFormValid,
  }) {
    return CreatePlantState(
      plantName: plantName ?? this.plantName,
      waterHour: waterHour ?? this.waterHour,
      description: description ?? this.description,
      isFormValid: isFormValid ?? this.isFormValid,
    );
  }
}
