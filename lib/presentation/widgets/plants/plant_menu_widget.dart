import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:plantify/domain/entities/plant.dart';

class PlantMenu extends StatelessWidget {
  final Plant plant;
  const PlantMenu({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: Container(
        width: 200,
        height: 200,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.lightGreen.withOpacity(.8),
            borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              right: 20,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: IconButton(
                  onPressed: () {
                    //TODO: Implementar la funcionalidad de regar la planta
                  },
                  icon: const Icon(Icons.water_drop_outlined),
                  iconSize: 30,
                ),
              ),
            ),
            Positioned(
              left: 50,
              right: 50,
              top: 50,
              bottom: 50,
              child: Image.asset('assets/plantas/plantaPrueba.png'),
            ),
            Positioned(
              bottom: 15,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    plant.plantName,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    plant.waterHour,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
