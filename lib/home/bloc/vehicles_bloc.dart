import 'dart:async';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:example_app/data/models/vehicle.dart';
import 'package:example_app/data/repositories/vehicle.repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

part 'vehicles_event.dart';
part 'vehicles_state.dart';

final VehicleRepository _vehicleRepository = VehicleRepository();

EventTransformer<E> throttleDroppable<E>() {
  return (events, mapper) {
    return droppable<E>().call(
      events.throttle(
        const Duration(milliseconds: 100),
      ),
      mapper,
    );
  };
}

class VehiclesBloc extends Bloc<VehiclesEvent, VehiclesState> {
  VehiclesBloc() : super(const VehiclesState()) {
    on<VehiclesFetched>(
      _onVehiclesFetched,
      transformer: throttleDroppable(),
    );
  }

  Future<void> _onVehiclesFetched(
    VehiclesFetched event,
    Emitter<VehiclesState> emit,
  ) async {
    try {
      if (state.status == VehiclesStatus.initial) {
        final vehicles = await _vehicleRepository.fetchVehicles();

        return emit(
          state.copyWith(
            status: VehiclesStatus.success,
            vehicles: vehicles,
            hasReachedMax: false,
          ),
        );
      }

      final vehicles = await _vehicleRepository.fetchVehicles();

      vehicles.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: VehiclesStatus.success,
                vehicles: [...state.vehicles, ...vehicles],
                hasReachedMax: false,
              ),
            );
    } catch (_) {
      emit(state.copyWith(status: VehiclesStatus.error));
    }
  }
}
