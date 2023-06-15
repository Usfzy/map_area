
class FarmDetailsModel {
    final int? statusCode;
    final String? message;
    final Data? data;

    FarmDetailsModel({
        this.statusCode,
        this.message,
        this.data,
    });

    factory FarmDetailsModel.fromJson(Map<String, dynamic> json) => FarmDetailsModel(
        statusCode: json['status_code'],
        message: json['message'],
        data: json['data'] == null ? null : Data.fromJson(json['data']),
    );

    Map<String, dynamic> toJson() => {
        'status_code': statusCode,
        'message': message,
        'data': data?.toJson(),
    };
}

class Data {
    final Farmer? farmer;
    final List<Farm>? farms;

    Data({
        this.farmer,
        this.farms,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        farmer: json['farmer'] == null ? null : Farmer.fromJson(json['farmer']),
        farms: json['farms'] == null ? [] : List<Farm>.from(json['farms']!.map((x) => Farm.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        'farmer': farmer?.toJson(),
        'farms': farms == null ? [] : List<dynamic>.from(farms!.map((x) => x.toJson())),
    };
}

class Farmer {
    final String? firstName;
    final String? lastName;
    final String? otherName;

    Farmer({
        this.firstName,
        this.lastName,
        this.otherName,
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
    final String? id;
    final String? plantation;
    final List<MapElement>? map;
    final String? farmerId;
    final String? farmTitle;
    final String? farmAddress;
    final int? farmLandSize;
    final String? farmMeasurementType;
    final double? cultivatedAreaSize;
    final String? cultivatedAreaMeasurementType;
    final String? landOwnership;

    Farm({
        this.id,
        this.plantation,
        this.map,
        this.farmerId,
        this.farmTitle,
        this.farmAddress,
        this.farmLandSize,
        this.farmMeasurementType,
        this.cultivatedAreaSize,
        this.cultivatedAreaMeasurementType,
        this.landOwnership,
    });

    factory Farm.fromJson(Map<String, dynamic> json) => Farm(
        id: json['_id'],
        plantation: json['plantation'],
        map: json['map'] == null ? [] : List<MapElement>.from(json['map']!.map((x) => MapElement.fromJson(x))),
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
        'map': map == null ? [] : List<dynamic>.from(map!.map((x) => x.toJson())),
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
    final String? id;
    final String? polygonId;
    final List<Point>? points;

    MapElement({
        this.id,
        this.polygonId,
        this.points,
    });

    factory MapElement.fromJson(Map<String, dynamic> json) => MapElement(
        id: json['_id'],

        polygonId: json['polygon_id'],
        points: json['points'] == null ? [] : List<Point>.from(json['points']!.map((x) => Point.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        '_id': id,

        'polygon_id': polygonId,
        'points': points == null ? [] : List<dynamic>.from(points!.map((x) => x.toJson())),
    };
}

class Point {
    final String? id;
    final String? long;
    final String? lat;

    Point({
        this.id,
        this.long,
        this.lat,
    });

    factory Point.fromJson(Map<String, dynamic> json) => Point(
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