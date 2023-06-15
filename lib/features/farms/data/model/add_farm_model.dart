class AddFarmModel {
  final String title;
  final String address;
  final FarmArea farm;
  final CultivatedArea cultivatedArea;
  final String plantation;
  final String ownershipType;
  final List<AddMapElement> map;

  AddFarmModel({
    required this.title,
    required this.address,
    required this.farm,
    required this.cultivatedArea,
    required this.plantation,
    required this.ownershipType,
    required this.map,
  });

  factory AddFarmModel.fromJson(Map<String, dynamic> json) => AddFarmModel(
        title: json['title'],
        address: json['address'],
        farm: FarmArea.fromJson(json['farm']),
        cultivatedArea: CultivatedArea.fromJson(json['cultivated_area']),
        plantation: json['plantation'],
        ownershipType: json['ownership_type'],
        map: List<AddMapElement>.from(json['map'].map((x) => AddMapElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'address': address,
        'farm': farm.toJson(),
        'cultivated_area': cultivatedArea.toJson(),
        'plantation': plantation,
        'ownership_type': ownershipType,
        'map': List<dynamic>.from(map.map((x) => x.toJson())),
      };
}

class CultivatedArea {
  final double size;
  final String measurementType;

  CultivatedArea({
    required this.size,
    required this.measurementType,
  });

  factory CultivatedArea.fromJson(Map<String, dynamic> json) => CultivatedArea(
        size: json['size']?.toDouble(),
        measurementType: json['measurement_type'],
      );

  Map<String, dynamic> toJson() => {
        'size': size,
        'measurement_type': measurementType,
      };
}

class FarmArea {
  final double size;
  final String measurementType;

  FarmArea({
    required this.size,
    required this.measurementType,
  });

  factory FarmArea.fromJson(Map<String, dynamic> json) => FarmArea(
        size: json['size']?.toDouble(),
        measurementType: json['measurement_type'],
      );

  Map<String, dynamic> toJson() => {
        'size': size,
        'measurement_type': measurementType,
      };
}

class AddMapElement {
  final String polygonId;
  final List<Point> points;

  AddMapElement({
    required this.polygonId,
    required this.points,
  });

  factory AddMapElement.fromJson(Map<String, dynamic> json) => AddMapElement(
        polygonId: json['polygon_id'],
        points: List<Point>.from(json['points'].map((x) => Point.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'polygon_id': polygonId,
        'points': List<dynamic>.from(points.map((x) => x.toJson())),
      };
}

class Point {
  final String long;
  final String lat;

  Point({
    required this.long,
    required this.lat,
  });

  factory Point.fromJson(Map<String, dynamic> json) => Point(
        long: json['long'],
        lat: json['lat'],
      );

  Map<String, dynamic> toJson() => {
        'long': long,
        'lat': lat,
      };
}
