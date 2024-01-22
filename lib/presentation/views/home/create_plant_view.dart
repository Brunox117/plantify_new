import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plantify/presentation/providers/providers.dart';
import 'package:plantify/presentation/widgets/widgets.dart';

class CreatePlantView extends StatelessWidget {
  const CreatePlantView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: const CustomAppbar(title: 'Crear planta'),
          body: _PlantForm()),
    );
  }
}

class _PlantForm extends ConsumerWidget {
  //final Plant plant;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final plantForm = ref.watch(createPlantProvider);
    final colors = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;
    return ListView(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              'Información de la planta',
              style: textStyles.titleLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomFormField(
                isTopField: true,
                hint: 'Nombre de la planta',
                onChanged: (value) => ref
                    .read(createPlantProvider.notifier)
                    .onPlantNameChanged(value),
                errorMessage: plantForm.plantName.errorMessage,
                hintStyle: const TextStyle(
                  color: Colors.black45,
                )),
            const SizedBox(
              height: 10,
            ),
            //Create a buttom that displays a timepicker
            ElevatedButton(
              onPressed: () async {
                // Despliega el timePicker
                final selectedHour = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                  helpText: 'Selecciona una hora',
                  cancelText: 'Cancelar',
                );
                final selectedHourString =
                    '${selectedHour!.hour.toString()}:${selectedHour.hour.toString()}';
                ref
                    .read(createPlantProvider.notifier)
                    .onWaterHourChanged(selectedHourString);
              },
              child: const Text('Seleccionar hora de riego'),
            ),
            const SizedBox(
              height: 10,
            ),
            Text('La hora seleccionada es: ${plantForm.waterHour.value}'),
            const SizedBox(
              height: 30,
            ),
            CustomFormField(
              hint: 'Información adicional',
              isBottomField: true,
              maxLines: 7,
              hintStyle: const TextStyle(color: Colors.black45),
              onChanged: (value) => ref
                  .read(createPlantProvider.notifier)
                  .onDescriptionChanged(value),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: IconButton(
                  onPressed: () async {
                    Future<bool> submited = ref.read(createPlantProvider.notifier).onSubmit();
                    if (await submited) {
                      //todo limpiar formulario
                    }
                    
                  },
                  icon: Icon(
                    Icons.add_circle_outline_rounded,
                    size: 70,
                    color: colors.secondary,
                  )),
            ),
          ],
        ),
      ),
    ]);
  }
}
