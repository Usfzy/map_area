class FarmDetailsModel {
  final int statusCode;
  final String message;
  final Data data;

  FarmDetailsModel({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory FarmDetailsModel.fromJson(Map<String, dynamic> json) => FarmDetailsModel(
        statusCode: json['status_code'],
        message: json['message'],
        data: Data.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'status_code': statusCode,
        'message': message,
        'data': data.toJson(),
      };
}

class Data {
  final Farmer farmer;
  final List<Farm> farms;

  Data({
    required this.farmer,
    required this.farms,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        farmer: Farmer.fromJson(json['farmer']),
        farms: List<Farm>.from(json['farms'].map((x) => Farm.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'farmer': farmer.toJson(),
        'farms': List<dynamic>.from(farms.map((x) => x.toJson())),
      };
}

class Farmer {
  final String firstName;
  final String lastName;
  final String otherName;

  Farmer({
    required this.firstName,
    required this.lastName,
    required this.otherName,
  });

  factory Farmer.fromJson(Map<String, dynamic> json) => Farmer(
        firstName: json['first_name'],
        lastName: json['last_name'],
        otherName: json['other_name'],
      );

  Map<String, dynamic> toJson() => {
        'first_name': firstName,
        'last_name': lastName,
        'other_name': otherName,
      };
}

class Farm {
  final String id;
  final String plantation;
  final List<MapElement> map;
  final String farmerId;
  final String farmTitle;
  final String farmAddress;
  final int farmLandSize;
  final String farmMeasurementType;
  final double cultivatedAreaSize;
  final String cultivatedAreaMeasurementType;
  final String landOwnership;

  Farm({
    required this.id,
    required this.plantation,
    required this.map,
    required this.farmerId,
    required this.farmTitle,
    required this.farmAddress,
    required this.farmLandSize,
    required this.farmMeasurementType,
    required this.cultivatedAreaSize,
    required this.cultivatedAreaMeasurementType,
    required this.landOwnership,
  });

  factory Farm.fromJson(Map<String, dynamic> json) => Farm(
        id: json['_id'],
        plantation: json['plantation'],
        map: List<MapElement>.from(json['map'].map((x) => MapElement.fromJson(x))),
        farmerId: json['farmer_id'],
        farmTitle: json['farm_title'],
        farmAddress: json['farm_address'],
        farmLandSize: json['farm_land_size'],
        farmMeasurementType: json['farm_measurement_type'],
        cultivatedAreaSize: json['cultivated_area_size']?.toDouble(),
        cultivatedAreaMeasurementType: json['cultivated_area_measurement_type'],
        landOwnership: json['land_ownership'],
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'plantation': plantation,
        'map': List<dynamic>.from(map.map((x) => x.toJson())),
        'farmer_id': farmerId,
        'farm_title': farmTitle,
        'farm_address': farmAddress,
        'farm_land_size': farmLandSize,
        'farm_measurement_type': farmMeasurementType,
        'cultivated_area_size': cultivatedAreaSize,
        'cultivated_area_measurement_type': cultivatedAreaMeasurementType,
        'land_ownership': landOwnership,
      };
}

class MapElement {
  final String id;
  final String long;
  final String lat;

  MapElement({
    required this.id,
    required this.long,
    required this.lat,
  });

  factory MapElement.fromJson(Map<String, dynamic> json) => MapElement(
        id: json['_id'],
        long: json['long'],
        lat: json['lat'],
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'long': long,
        'lat': lat,
      };
}
