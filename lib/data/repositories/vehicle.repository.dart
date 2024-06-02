import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:example_app/data/api/api_client.dart';
import 'package:example_app/data/models/vehicle.dart';

// Normally we would have used an abstract
// for the sake of dependency injection but out of simplicity
// we will use a direct implementation

class VehicleRepository {
  VehicleRepository();

  final ApiClient _apiClient = ApiClient();

  int _currentPage = 0;

  Future<List<Vehicle>> fetchVehicles() async {
    final newVehiclesResponse = await _apiClient.fetchData(_currentPage);
    final newVehicles = _deserializeVehicles(newVehiclesResponse.body);
    log(_currentPage.toString());

    _currentPage++;

    return newVehicles;
  }

  _deserializeVehicles(String vehiclesBody) {
    final List<dynamic> vehicles = jsonDecode(vehiclesBody) as List<dynamic>;

    return vehicles.map((vehicle) => Vehicle.fromJson(vehicle)).toList();
  }

  void reset() {
    _currentPage = 0;
  }
}
