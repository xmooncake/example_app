part of 'vehicles_bloc.dart';

enum VehiclesStatus { initial, success, error }

class VehiclesState extends Equatable {
  const VehiclesState({
    this.status = VehiclesStatus.initial,
    this.vehicles = const [],
    this.hasReachedMax = false,
  });

  final VehiclesStatus status;
  final List<Vehicle> vehicles;
  final bool hasReachedMax;

  VehiclesState copyWith({
    VehiclesStatus? status,
    List<Vehicle>? vehicles,
    bool? hasReachedMax,
  }) {
    return VehiclesState(
      status: status ?? this.status,
      vehicles: vehicles ?? this.vehicles,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props => [status, vehicles, hasReachedMax];
}
