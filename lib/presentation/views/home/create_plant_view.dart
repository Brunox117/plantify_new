import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:plantify/domain/entities/plant.dart';
import 'package:plantify/presentation/providers/providers.dart';
import 'package:plantify/presentation/widgets/widgets.dart';

class CreatePlantView extends StatelessWidget {
  const CreatePlantView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppbar(title: 'Crear planta'),
        body: _PlantForm(),
      ),
    );
  }
}

class _PlantForm extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlantFormState();
}

class _PlantFormState extends ConsumerState<_PlantForm> {
  void _submitPlant(Plant plant) async {
    ref.read(plantsProvider.notifier).addPlant(plant);
  }

  final _formKey = GlobalKey<FormState>();

  String plantName = '';
  String waterHour = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            const SizedBox(height: 30),
            Text(
              'Información de la planta',
              style: textStyles.titleLarge,
            ),
            const SizedBox(height: 10),
            CustomFormField(
              hintStyle: const TextStyle(color: Colors.black54),
              isTopField: true,
              hint: 'Nombre de la planta',
              onChanged: (value) => plantName = value,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'El nombre de la planta es requerido';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                final selectedHour = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                  helpText: 'Selecciona una hora',
                  cancelText: 'Cancelar',
                );
                if (selectedHour != null) {
                  setState(() {
                    waterHour =
                        '${selectedHour.hour.toString()}:${selectedHour.minute.toString()}';
                  });
                }
              },
              child: const Text('Seleccionar hora de riego'),
            ),
            const SizedBox(height: 10),
            Text('La hora seleccionada es: $waterHour'),
            const SizedBox(height: 30),
            CustomFormField(
              hintStyle: const TextStyle(color: Colors.black54),
              hint: 'Información adicional',
              isBottomField: true,
              maxLines: 7,
              onChanged: (value) => description = value,
            ),
            const SizedBox(height: 10),
            Center(
              child: IconButton(
                onPressed: _submitForm,
                icon: Icon(
                  Icons.add_circle_outline_rounded,
                  size: 70,
                  color: colors.secondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final plant = Plant(
        plantName: plantName,
        waterHour: waterHour,
        description: description,
      );
      _formKey.currentState!.reset();
      setState(() {
        waterHour = '';
        description = '';
      });
      _submitPlant(plant);
      context.go('/');
    }
  }
}
