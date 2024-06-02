class Vehicle {
  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      name: json['name'] as String,
      licensePlate: json['dmv_license_plate_number'] as String,
    );
  }

  Vehicle({
    required this.name,
    required this.licensePlate,
  });

  final String name;
  final String licensePlate;
}

// {
//     "active": "YES",
//     "vehicle_license_number": "6014449",
//     "name": "AHMED,MDSULTAN",
//     "license_type": "FOR HIRE VEHICLE",
//     "expiration_date": "2024-12-27T00:00:00.000",
//     "permit_license_number": "AA054",
//     "dmv_license_plate_number": "T110696C",
//     "vehicle_vin_number": "4T1BD1FK7GU186145",
//     "certification_date": "2022-12-09T00:00:00.000",
//     "hack_up_date": "2022-12-27T00:00:00.000",
//     "vehicle_year": "2016",
//     "base_number": "B02932",
//     "base_name": "GRAND TRANSPORTATION SERVICES INC",
//     "base_type": "BLACK-CAR",
//     "veh": "HYB",
//     "base_telephone_number": "(718)433-4255",
//     "website": "WWW.GRANDLIMONY.COM",
//     "base_address": "36-13   32 STREET LIC NY 11106",
//     "reason": "G",
//     "last_date_updated": "2024-05-30T00:00:00.000",
//     "last_time_updated": "13:25"
//   },