import 'package:example_app/data/models/vehicle.dart';
import 'package:example_app/details/details.screen.dart';
import 'package:flutter/material.dart';

class VehiclesListItem extends StatelessWidget {
  const VehiclesListItem({super.key, required this.vehicle});

  final Vehicle vehicle;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailsScreen(vehicle: vehicle),
          ),
        ),
        title: Text(vehicle.name),
        subtitle: Text(vehicle.licensePlate),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
