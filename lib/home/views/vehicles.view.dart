import 'package:example_app/home/bloc/vehicles_bloc.dart';
import 'package:example_app/home/components/vehicles_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VehiclesView extends StatelessWidget {
  const VehiclesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VehiclesBloc()..add(VehiclesFetched()),
      child: const VehiclesList(),
    );
  }
}
