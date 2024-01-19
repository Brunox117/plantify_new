import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

enum NameError { empty }

enum WaterHourError { empty, format }

class PlantName extends FormzInput<String, NameError> {
  const PlantName.pure() : super.pure('');
  const PlantName.dirty([String value = '']) : super.dirty(value);

  String? get errorMessage {
    if (error == NameError.empty) {
      return 'Porfavor ingresa un nombre';
    }
    return null;
  }

  @override
  NameError? validator(String? value) {
    return value?.isNotEmpty == true ? null : NameError.empty;
  }
}

class WaterHour extends FormzInput<TimeOfDay, WaterHourError> {
  const WaterHour.pure() : super.pure(const TimeOfDay(hour: 00, minute: 00));
  const WaterHour.dirty(
      [TimeOfDay value = const TimeOfDay(hour: 00, minute: 00)])
      : super.dirty(value);

  String? get errorMessage {
    if (error == WaterHourError.empty) {
      return 'Porfavor ingresa una hora';
    }
    if (error == WaterHourError.format) {
      return 'Porfavor ingresa una hora valida';
    }
    return null;
  }

  @override
  WaterHourError? validator(TimeOfDay? value) {
    if (value?.toString().isEmpty == true) {
      return WaterHourError.empty;
    }
    if ((value is TimeOfDay) == false) {
      return WaterHourError.format;
    }
    return null;
  }
}
