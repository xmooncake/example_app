import 'package:example_app/data/models/vehicle.dart';
import 'package:flutter/material.dart';

class VehiclesListItem extends StatelessWidget {
  const VehiclesListItem({super.key, required this.vehicle});

  final Vehicle vehicle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(vehicle.name),
      subtitle: Text(vehicle.licensePlate),
    );
  }
}
