import 'package:example_app/data/models/vehicle.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.vehicle});

  final Vehicle vehicle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vehicle details'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(vehicle.name),
            Text(vehicle.licensePlate),
          ],
        ),
      ),
    );
  }
}
